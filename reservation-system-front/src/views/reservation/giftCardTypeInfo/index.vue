<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="会员卡类型名称" prop="giftCardTypeName">
        <el-input
          v-model="queryParams.giftCardTypeName"
          placeholder="请输入会员卡类型名称"
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
          v-hasPermi="['reservation:giftCardTypeInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:giftCardTypeInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:giftCardTypeInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:giftCardTypeInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="giftCardTypeInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="giftCardTypeId" />
      <el-table-column label="会员卡类型名称" align="center" prop="giftCardTypeName" />
      <el-table-column label="会员卡出售价格" align="center" prop="giftCardSellPrice" />
      <el-table-column label="会员卡抵扣价格" align="center" prop="giftCardDeductionPrice" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:giftCardTypeInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:giftCardTypeInfo:remove']">删除</el-button>
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

    <!-- 添加或修改会员卡类型对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="giftCardTypeInfoRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="会员卡类型名称" prop="giftCardTypeName">
          <el-input v-model="form.giftCardTypeName" placeholder="请输入会员卡类型名称" />
        </el-form-item>
        <el-form-item label="会员卡出售价格" prop="giftCardSellPrice">
          <el-input type="number" controls-position="right" v-model="form.giftCardSellPrice" placeholder="请输入会员卡出售价格" />
        </el-form-item>
        <el-form-item label="会员卡抵扣价格" prop="giftCardDeductionPrice">
          <el-input type="number" controls-position="right" v-model="form.giftCardDeductionPrice" placeholder="请输入会员卡抵扣价格" />
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

<script setup name="GiftCardTypeInfo">
import { listGiftCardTypeInfo, getGiftCardTypeInfo, delGiftCardTypeInfo, addGiftCardTypeInfo, updateGiftCardTypeInfo } from "@/api/reservation/giftCardTypeInfo";

const { proxy } = getCurrentInstance();

const giftCardTypeInfoList = ref([]);
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
    giftCardTypeName: null,
  },
  rules: {
    giftCardTypeName: [
      { required: true, message: "会员卡类型名称不能为空", trigger: "blur" }
    ],
    giftCardSellPrice: [
      { required: true, message: "会员卡出售价格不能为空", trigger: "blur" }
    ],
    giftCardDeductionPrice: [
      { required: true, message: "会员卡抵扣价格不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询会员卡类型列表 */
function getList() {
  loading.value = true;
  listGiftCardTypeInfo(queryParams.value).then(response => {
    giftCardTypeInfoList.value = response.rows;
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
    giftCardTypeId: null,
    giftCardTypeName: null,
    giftCardSellPrice: null,
    giftCardDeductionPrice: null,
    createTime: null,
    createBy: null
  };
  proxy.resetForm("giftCardTypeInfoRef");
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
  ids.value = selection.map(item => item.giftCardTypeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加会员卡类型";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _giftCardTypeId = row.giftCardTypeId || ids.value
  getGiftCardTypeInfo(_giftCardTypeId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改会员卡类型";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["giftCardTypeInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.giftCardTypeId != null) {
        updateGiftCardTypeInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addGiftCardTypeInfo(form.value).then(response => {
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
  const _giftCardTypeIds = row.giftCardTypeId || ids.value;
  proxy.$modal.confirm('是否确认删除会员卡类型编号为"' + _giftCardTypeIds + '"的数据项？').then(function() {
    return delGiftCardTypeInfo(_giftCardTypeIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('reservation/giftCardTypeInfo/export', {
    ...queryParams.value
  }, `giftCardTypeInfo_${new Date().getTime()}.xlsx`)
}

getList();
</script>
