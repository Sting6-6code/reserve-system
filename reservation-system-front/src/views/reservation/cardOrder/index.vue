<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="预约卡片ID" prop="cardId">
        <el-input
          v-model="queryParams.cardId"
          placeholder="请输入预约卡片ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付类型" prop="payType">
        <el-select v-model="queryParams.payType" placeholder="请选择支付类型" clearable>
          <el-option
            v-for="dict in sys_card_pay_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="支付日期">
        <el-date-picker
            v-model="queryParams.payTime"
            type="date"
            placeholder="请选择日期"
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
          v-hasPermi="['reservation:cardOrder:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:cardOrder:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:cardOrder:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:cardOrder:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cardOrderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="预约卡片ID" align="center" prop="cardId" />
      <el-table-column label="支付金额" align="center" prop="payAmount" />
      <el-table-column label="支付类型" align="center" prop="payType">
        <template #default="scope">
          <dict-tag :options="sys_card_pay_type" :value="scope.row.payType"/>
        </template>
      </el-table-column>
      <el-table-column label="支付时间" align="center" prop="payTime" />
<!--      <el-table-column label="礼品卡编号" align="center" prop="giftCard" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:cardOrder:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:cardOrder:remove']">删除</el-button>
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

    <!-- 添加或修改预约卡片支付管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="cardOrderRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="预约卡片ID" prop="cardId">
          <el-input v-model="form.cardId" placeholder="请输入预约卡片ID" />
        </el-form-item>
        <el-form-item label="支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入支付金额" />
        </el-form-item>
        <el-form-item label="支付类型" prop="payType">
          <el-select v-model="form.payType" placeholder="请选择支付类型">
            <el-option
              v-for="dict in sys_card_pay_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
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

<script setup name="CardOrder">
import { listCardOrder, getCardOrder, delCardOrder, addCardOrder, updateCardOrder } from "@/api/reservation/cardOrder";

const { proxy } = getCurrentInstance();
const { sys_card_pay_type } = proxy.useDict('sys_card_pay_type');

const cardOrderList = ref([]);
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
    cardId: null,
    payType: null,
    payTime: null,
  },
  rules: {
    cardId: [
      { required: true, message: "预约卡片ID不能为空", trigger: "blur" }
    ],
    payAmount: [
      { required: true, message: "支付金额不能为空", trigger: "blur" }
    ],
    payType: [
      { required: true, message: "支付类型不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询预约卡片支付管理列表 */
function getList() {
  loading.value = true;
  listCardOrder(queryParams.value).then(response => {
    cardOrderList.value = response.rows;
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
    cardId: null,
    payAmount: null,
    payType: null,
    payTime: null,
    createTime: null,
    createBy: null
  };
  proxy.resetForm("cardOrderRef");
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
  ids.value = selection.map(item => item.cardId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  proxy.$modal.msgWarning('支付后不允许添加数据,避免导致数据不一致')
  return
  reset();
  open.value = true;
  title.value = "添加预约卡片支付管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  proxy.$modal.msgWarning('支付后不允许添加数据,避免导致数据不一致')
  return
  reset();
  const _cardId = row.cardId || ids.value
  getCardOrder(_cardId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改预约卡片支付管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["cardOrderRef"].validate(valid => {
    if (valid) {
      if (form.value.cardId != null) {
        updateCardOrder(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCardOrder(form.value).then(response => {
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
  proxy.$modal.msgWarning('支付后不允许添加数据,避免导致数据不一致')
  return
  const _cardIds = row.cardId || ids.value;
  proxy.$modal.confirm('是否确认删除预约卡片支付管理编号为"' + _cardIds + '"的数据项？').then(function() {
    return delCardOrder(_cardIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('reservation/cardOrder/export', {
    ...queryParams.value
  }, `cardOrder_${new Date().getTime()}.xlsx`)
}

getList();
</script>
