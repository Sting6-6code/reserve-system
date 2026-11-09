<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="客户姓名" prop="customNickName">
        <el-input
          v-model="queryParams.customNickName"
          placeholder="请输入客户姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户电话" prop="customPhone">
        <el-input
          v-model="queryParams.customPhone"
          placeholder="请输入客户电话"
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
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['reservation:costomInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:costomInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:costomInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:costomInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="costomInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="客户ID" align="center" prop="customId" />
<!--      <el-table-column label="客户用户名" align="center" prop="customUserName" />-->
      <el-table-column label="客户姓名" align="center" prop="customNickName" />
      <el-table-column label="客户电话" align="center" prop="customPhone" />
<!--      <el-table-column label="客户头像" align="center" prop="customAvatar" width="100">-->
<!--        <template #default="scope">-->
<!--          <image-preview :src="scope.row.customAvatar" :width="50" :height="50"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="客户地址" align="center" prop="customAddress" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:costomInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:costomInfo:remove']">删除</el-button>
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

    <!-- 添加或修改预约客户管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="costomInfoRef" :model="form" :rules="rules" label-width="120px">
<!--        <el-form-item label="客户用户名" prop="customUserName">-->
<!--          <el-input v-model="form.customUserName" placeholder="请输入客户用户名" />-->
<!--        </el-form-item>-->
        <el-form-item label="客户姓名" prop="customNickName">
          <el-input v-model="form.customNickName" placeholder="请输入客户姓名" />
        </el-form-item>
        <el-form-item label="客户电话" prop="customPhone">
          <el-input v-model="form.customPhone" placeholder="请输入客户电话" />
        </el-form-item>

<!--        <el-form-item label="客户密码" prop="customPassword">-->
<!--          <el-input v-model="form.customPassword" placeholder="请输入客户密码" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="客户头像" prop="customAvatar">-->
<!--          <image-upload v-model="form.customAvatar"/>-->
<!--        </el-form-item>-->
        <el-form-item label="客户地址" prop="customAddress">
          <el-input v-model="form.customAddress" placeholder="请输入客户地址" />
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

<script setup name="CostomInfo">
import { listCostomInfo, getCostomInfo, delCostomInfo, addCostomInfo, updateCostomInfo } from "@/api/reservation/costomInfo";

const { proxy } = getCurrentInstance();

const costomInfoList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    customNickName: null,
    customPhone: null,
  },
  rules: {
    customPhone: [
      { required: true, message: "客户电话不能为空", trigger: "blur" }
    ],
    customNickName:[
      { required: true, message: "客户姓名不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询预约客户管理列表 */
function getList() {
  loading.value = true;
  listCostomInfo(queryParams.value).then(response => {
    costomInfoList.value = response.rows;
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
    customId: null,
    customUserName: null,
    customNickName: null,
    customPassword: null,
    customAvatar: null,
    customAddress: null,
    customPhone: null,
    createTime: null,
    createBy: null
  };
  proxy.resetForm("costomInfoRef");
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
  ids.value = selection.map(item => item.customId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加预约客户管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _customId = row.customId || ids.value
  getCostomInfo(_customId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改预约客户管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["costomInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.customId != null) {
        updateCostomInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCostomInfo(form.value).then(response => {
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
  const _customIds = row.customId || ids.value;
  proxy.$modal.confirm('是否确认删除预约客户管理编号为"' + _customIds + '"的数据项？').then(function() {
    return delCostomInfo(_customIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('reservation/costomInfo/export', {
    ...queryParams.value
  }, `costomInfo_${new Date().getTime()}.xlsx`)
}

getList();
</script>
