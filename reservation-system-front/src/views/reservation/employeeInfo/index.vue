<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
              v-model="deptName"
              placeholder="请输入部门名称"
              clearable
              prefix-icon="Search"
              style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
              :data="deptOptions"
              :props="{ label: 'label', children: 'children' }"
              :expand-on-click-node="false"
              :filter-node-method="filterNode"
              ref="deptTreeRef"
              node-key="id"
              highlight-current
              default-expand-all
              @node-click="handleNodeClick"
          />
        </div>

        <h3 style="text-align: center;background: var(--el-color-primary-light-9);margin-bottom: 0;padding: 5px;">员工列表</h3>
        <div class="header-container" style="height: 700px;overflow: scroll;border: none;">
          <el-table v-loading="loading" :data="userList" :show-header="false">
            <el-table-column label="用户昵称" align="center" key="nickName" prop="nickName"/>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
              <template #default="scope">
                <el-tooltip content="添加至预约员工列表" placement="top">
                  <el-button link type="primary" icon="Plus" @click="addEmployee(scope.row)" v-hasPermi="['system:employeeInfo:add']" v-if="!scope.row.isBindToEmployee"></el-button>
                  <el-button link type="info" disabled v-hasPermi="['system:employeeInfo:add']" v-else>已添加</el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-col>
      <el-col :span="16" :xs="24">
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="员工姓名" prop="employeeId">
            <el-input
                v-model="queryParams.nickName"
                placeholder="请输入员工姓名"
                clearable
                @keyup.enter="handleQuery"
            />
          </el-form-item>
          <el-form-item label="员工编号" prop="employeeCode">
            <el-input
                v-model="queryParams.employeeCode"
                placeholder="请输入员工编号"
                clearable
                @keyup.enter="handleQuery"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
                type="primary"
                plain
                icon="Add"
                @click="handleAdd"
                v-hasPermi="['system:employeeInfo:add']"
            >增加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
                type="success"
                plain
                icon="Edit"
                :disabled="single"
                @click="handleUpdate"
                v-hasPermi="['system:employeeInfo:edit']"
            >修改</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
                type="danger"
                plain
                icon="Delete"
                :disabled="multiple"
                @click="handleDelete"
                v-hasPermi="['system:employeeInfo:remove']"
            >删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
                type="warning"
                plain
                icon="Download"
                @click="handleExport"
                v-hasPermi="['system:employeeInfo:export']"
            >导出</el-button>
          </el-col>
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="employeeInfoList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column label="员工ID" align="center" prop="employeeId" />
          <el-table-column label="员工姓名" align="center" prop="nickName" />
          <el-table-column label="员工电话" align="center" prop="phone" />
          <el-table-column label="员工生日" align="center" prop="birth" />
          <el-table-column label="是否营业" align="center" prop="activeOrNot">
            <template #default="scope">
              <span>{{scope.row.activeOrNot=='1'?'营业':'不营业'}}</span>
            </template>
          </el-table-column>
          <el-table-column label="封面照片" align="center" prop="coverImage" width="100">
            <template #default="scope">
              <image-preview :src="scope.row.coverImage" :width="50" :height="50"/>
            </template>
          </el-table-column>
          <el-table-column label="个人介绍" align="center" prop="personalIntroduction" />
          <el-table-column label="员工编号" align="center" prop="employeeCode" />
          <el-table-column label="员工排序" align="center" prop="orderNum" />
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="200px">
            <template #default="scope">
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:employeeInfo:edit']">修改</el-button>
              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:employeeInfo:remove']">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination
            v-show="total>0"
            :total="total"
            v-model:page="queryParams.pageNum"
            v-model:limit="queryParams.pageSize"
            @pagination="getList"
        />
      </el-col>
    </el-row>


    <!-- 添加或修改员工管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="employeeInfoRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="封面照片" prop="coverImage">
          <image-upload v-model="form.coverImage"/>
        </el-form-item>
        <el-form-item label="员工姓名" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="员工编号" prop="employeeCode">
          <el-input v-model="form.employeeCode" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="个人介绍" prop="personalIntroduction">
          <el-input v-model="form.personalIntroduction" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="员工生日" prop="birth">
          <el-date-picker
                          v-model="form.birth"
                          type="date"
                          placeholder="请输入员工生日"
                          format="YYYY-MM-DD"
                          value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="员工电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入员工编号" />
        </el-form-item>
        <el-form-item label="是否营业" prop="activeOrNot">
          <el-radio-group v-model="form.activeOrNot">
            <el-radio-button label="1">营业</el-radio-button>
            <el-radio-button label="2">不营业</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="员工排序" prop="orderNum">
          <el-input type="number" :min="0"  v-model="form.orderNum" :precision="0" placeholder="请输入员工排序" :value-on-clear="0"/>
        </el-form-item>

      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="EmployeeInfo">
import { listEmployeeInfo, getEmployeeInfo, delEmployeeInfo, addEmployeeInfo, updateEmployeeInfo } from "@/api/reservation/employeeInfo";
import {deptTreeSelect, listUser} from "@/api/system/user.js";
import moment from 'moment'

const { proxy } = getCurrentInstance();

const userList = ref([]);
const deptName = ref("");
const deptOptions = ref(undefined);
const employeeInfoList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true)
const showSearchForUser = ref(true);

const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const userTotal=ref(0);
const title = ref("");


/** 根据名称筛选部门树 */
watch(deptName, val => {
  proxy.$refs["deptTreeRef"].filter(val);
});

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    nickName:null,
    employeeId: null,
    employeeCode: null,
  },
  queryParamsForUser: {
    pageNum: 1,
    pageSize: 1000,
    nickName: null,
    deptId: undefined
  },
  rules: {
    nickName:[{required: true, trigger: "blur", message: "员工姓名不能为空"}]
  }
});

const { queryParams,queryParamsForUser, form, rules } = toRefs(data);


/** 查询部门下拉树结构 */
function getDeptTree() {
  deptTreeSelect().then(response => {
    deptOptions.value = response.data;
  });
};
/** 查询用户列表 */
function getUserList() {
  loading.value = true;
  listUser(queryParamsForUser.value).then(res => {
    loading.value = false;
    userList.value = res.rows;
    userTotal.value = res.total;
  });
};

/** 通过条件过滤节点  */
const filterNode = (value, data) => {
  if (!value) return true;
  return data.label.indexOf(value) !== -1;
};

/** 节点单击事件 */
function handleNodeClick(data) {
  console.log('节点单击事件',data)
  queryParamsForUser.value.deptId = data.id;
  handleQueryForUser();
};

/** 查询员工管理列表 */
function getList() {
  loading.value = true;
  listEmployeeInfo(queryParams.value).then(response => {
    employeeInfoList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    nickName:null,
    employeeId: null,
    coverImage: null,
    personalIntroduction: null,
    employeeCode: null,
    phone:null,
    birth:moment().format('YYYY-MM-DD'),
    orderNum:999,
    activeOrNot:'1',
    createBy: null,
    createTime: null
  };
  proxy.resetForm("employeeInfoRef");
}

function handleQueryForUser(){
  getUserList();
}
/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.employeeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 增加系统员工 */
function addEmployee(row) {
  addEmployeeInfo({...row,employeeId:row.userId,phone:row.phonenumber,coverImage: row.avatar,activeOrNot: '1'}).then(response => {
    console.log(row,response)
    proxy.$modal.msgSuccess(response.msg);
    handleQueryForUser();
    getList();
  });
}

/** 新增按钮操作 增加非系统员工（不和系统账号绑定的员工）*/
function handleAdd(){
  reset();
  open.value = true;
  title.value = "增加员工";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _employeeId = row.employeeId || ids.value
  getEmployeeInfo(_employeeId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改员工";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["employeeInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.employeeId != null) {
        updateEmployeeInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addEmployeeInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _employeeIds = row.employeeId || ids.value;
  proxy.$modal.confirm('是否确认删除员工管理编号为"' + _employeeIds + '"的数据项？').then(function() {
    return delEmployeeInfo(_employeeIds);
  }).then(() => {
    getList();
    getUserList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('system/employeeInfo/export', {
    ...queryParams.value
  }, `employeeInfo_${new Date().getTime()}.xlsx`)
}

getUserList()
getDeptTree();
getList();
</script>
<style scoped>
:deep(.header-container::-webkit-scrollbar){
  display: none;
  /*width: 0;*/
}

hr{
  border: 0; /* 清除默认样式 */
  border-top: 1px solid rgb(235, 238, 245); /* 设置红色边框 */
}

</style>
