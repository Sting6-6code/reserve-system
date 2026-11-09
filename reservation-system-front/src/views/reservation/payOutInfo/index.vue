<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="支出时间" prop="payOutTime">
        <el-date-picker
            v-model="queryParams.payOutTime"
            type="date"
            placeholder="请选择支出时间"
            size="small"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
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
          v-hasPermi="['reservation:payOutInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:payOutInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:payOutInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:payOutInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="payOutInfoList" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="支出时间" align="center" prop="payOutTime" />
      <el-table-column label="支出金额" align="center" prop="payOutAmount" />
      <el-table-column label="支出类型" align="center" prop="payOutType" />
      <el-table-column label="支出原因" align="center" prop="reason" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:payOutInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:payOutInfo:remove']">删除</el-button>
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

    <!-- 添加或修改支出管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="payOutInfoRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="支出时间" prop="payOutTime">
          <el-date-picker
              v-model="form.payOutTime"
              type="date"
              placeholder="请选择支出时间"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="支出金额" prop="payOutAmount">
          <el-input type="number" v-model="form.payOutAmount" placeholder="请输入支出金额" />
        </el-form-item>
        <el-form-item label="支出类型" prop="payOutType">
          <el-select
              v-model="form.payOutType"
              clearable
              placeholder="请选择支出类型"
          >
            <el-option
                v-for="(item,index) in payOutTypeOptions"
                :key="item.index"
                :label="item.label"
                :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="支出原因" prop="reason" v-if="form.payOutType=='其它'">
          <el-input v-model="form.reason" placeholder="请输入支出原因"></el-input>
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

<script setup name="PayOutInfo">
import { listPayOutInfo, getPayOutInfo, delPayOutInfo, addPayOutInfo, updatePayOutInfo } from "@/api/reservation/payOutInfo";
import moment from "moment";

const { proxy } = getCurrentInstance();

const payOutInfoList = ref([]);
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
    payOutTime: null,
    payOutType: null,
  },
  rules: {
    payOutTime: [
      { required: true, message: "支出时间不能为空", trigger: "blur" }
    ],
    payOutAmount: [
      { required: true, message: "支出金额不能为空", trigger: "blur" }
    ],
    payOutType: [
      { required: true, message: "支出类型不能为空", trigger: "change" }
    ],
    reason:[{ required: true, message: "支出原因不能为空", trigger: "blur" }]
  }
});



const payOutTypeOptions=reactive([
  {
    value: 'venmo小费',
    label: 'venmo小费',
  },
  {
    value: '刷卡小费',
    label: '刷卡小费',
  },
  {
    value: '其它',
    label: '其它',
  }
]);

const { queryParams, form, rules } = toRefs(data);

watch(() => form.value.payOutType, (value) => {
  console.log('监听表单',value)
  if(value && value==='其它'){
    if(!rules.value.hasOwnProperty('reason')){
      rules.value['reason']=[{ required: true, message: "支出原因不能为空", trigger: "blur" }]
    }
  }
},{deep:true})

/** 查询支出管理列表 */
function getList() {
  loading.value = true;
  listPayOutInfo(queryParams.value).then(response => {
    payOutInfoList.value = response.rows;
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
    id: null,
    payOutTime: queryParams.value.payOutTime,
    payOutAmount: null,
    payOutType: null,
    reason:null,
    createTime: null,
    createBy: null
  };
  proxy.resetForm("payOutInfoRef");
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
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加支出管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getPayOutInfo(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改支出管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["payOutInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePayOutInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPayOutInfo(form.value).then(response => {
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
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除支出管理编号为"' + _ids + '"的数据项？').then(function() {
    return delPayOutInfo(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('system/payOutInfo/export', {
    ...queryParams.value
  }, `payOutInfo_${new Date().getTime()}.xlsx`)
}

queryParams.value.payOutTime=moment().format("YYYY-MM-DD")
getList();
</script>
