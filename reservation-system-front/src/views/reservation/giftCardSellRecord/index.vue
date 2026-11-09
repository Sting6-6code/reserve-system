<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="会员卡编号" prop="giftCardCode">
        <el-input
          v-model="queryParams.giftCardCode"
          placeholder="请输入会员卡编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会员客户" prop="customNickName">
        <el-input
            v-model="queryParams.customNickName"
            placeholder="请输入客户姓名或手机号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="会员卡使用状态">-->
<!--        <el-select v-model="queryParams.status" placeholder="请选择会员卡使用状态" clearable>-->
<!--          <el-option-->
<!--            v-for="dict in sys_gift_card_status"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          />-->
<!--        </el-select>-->
<!--      </el-form-item>-->
      <el-form-item label="出售日期">
        <el-date-picker
            v-model="queryParams.sellDate"
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
          v-hasPermi="['reservation:giftCardSellRecord:add']"
        >出售会员卡</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['reservation:giftCardSellRecord:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['reservation:giftCardSellRecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['reservation:giftCardSellRecord:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="giftCardSellRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="id" align="center" prop="id" />-->
      <el-table-column label="出售客户" align="center" prop="customNickName" width="200px" fixed/>
      <el-table-column label="会员卡类型" align="center" prop="giftCardType" width="200px" fixed >
        <template #default="scope">
          <span>{{filterCardTypeName(scope.row.giftCardType)}}</span>
        </template>
      </el-table-column>
      <el-table-column label="会员卡编号" align="center" prop="giftCardCode" fixed width="200px"/>
      <el-table-column label="出售价格" align="center" prop="giftCardSellPrice" />
      <el-table-column label="抵扣价格" align="center" prop="giftCardDeductionPrice" />
<!--      <el-table-column label="会员卡使用状态" align="center" prop="status">-->
<!--        <template #default="scope">-->
<!--          <dict-tag :options="sys_gift_card_status" :value="scope.row.status"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="现金支付金额"  align="center" prop="xj" width="120px"/>
      <el-table-column label="刷卡支付金额"  align="center" prop="sk" width="120px"/>
      <el-table-column label="电子支付金额"  align="center" prop="dz" width="120px"/>
      <el-table-column label="出售日期" width="180px" align="center" prop="sellDate"/>
      <el-table-column label="操作" fixed="right" align="center" class-name="small-padding fixed-width" width="180px">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['reservation:giftCardSellRecord:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['reservation:giftCardSellRecord:remove']">删除</el-button>
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

    <!-- 添加或修改会员卡出售记录对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="giftCardSellRecordRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="会员卡类型" prop="status">
          <el-select v-model="form.giftCardType" placeholder="请选择会员卡类型" clearable>
            <el-option
                v-for="dict in giftCardType"
                :key="dict.giftCardTypeId"
                :label="dict.giftCardTypeName"
                :value="dict.giftCardTypeId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="预约客户" prop="customId" required>
          <el-select
              v-model="form.customId"
              :multiple="false"
              filterable
              default-first-option
              value-key="customId"
              :reserve-keyword="false"
              placeholder="请输入客户名称或手机号"
              :filter-method="filterCustom"
          >
            <template #empty>
              <div style="width: 100%;">
                <h3 style="margin-left: 15px;color: red;font-size: 12px;">无法匹配该用户,请在下方进行添加</h3>
                <div style="width: 100%;height: 150px;display: flex;justify-content: center;align-items: center;">
                  <el-form ref="costomInfoRef" :model="customForm" :rules="customFormRules" style="width: 80%;margin: auto">
                    <!--        <el-form-item label="客户用户名" prop="customUserName">-->
                    <!--          <el-input v-model="form.customUserName" placeholder="请输入客户用户名" />-->
                    <!--        </el-form-item>-->
                    <el-form-item label="客户电话" prop="customPhone">
                      <el-input size="small" v-model="customForm.customPhone" placeholder="请输入客户电话" />
                    </el-form-item>
                    <el-form-item label="客户姓名" prop="customNickName">
                      <el-input  size="small" v-model="customForm.customNickName" placeholder="请输入客户姓名" />
                    </el-form-item>
                    <div style="width:100%;height:36px;display: flex;justify-content: center;align-items: center;">
                      <el-button size="small" type="primary" @click="submitAddCustomForm">新增客户</el-button>
                    </div>

                  </el-form>
                </div>

              </div>
            </template>
            <el-option
                v-for="item in customOptions"
                :key="item.customId"
                :label="item.customNickName+'('+item.customPhone+')'"
                :value="item.customId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="会员卡编号" prop="giftCardCode">
          <el-input :disabled="form.id" v-model="form.giftCardCode" placeholder="请输入会员卡编号" />
        </el-form-item>
        <el-form-item label="会员卡出售价格" prop="giftCardSellPrice" >
          <el-input :min="0" type="number" controls-position="right" v-model="form.giftCardSellPrice" placeholder="请输入会员卡出售价格" style="--el-input-bg-color: #ecf9ff;"/>
        </el-form-item>
        <el-form-item label="会员卡充值金额" prop="giftCardDeductionPrice">
          <el-input :min="0" type="number" controls-position="right" v-model="form.giftCardDeductionPrice" placeholder="请输入会员卡抵扣价格" />
        </el-form-item>
        <el-divider>
          <el-icon class="el-icon--left"><Money /></el-icon>支付方式
        </el-divider>
        <el-form-item label="电子支付" prop="dz">
          <el-input :min="0" type="number" controls-position="right" v-model="form.dz" placeholder="请输入电子支付金额" style="--el-input-bg-color: #ecf9ff;"/>
        </el-form-item>
        <el-form-item label="刷卡支付" prop="sk">
          <el-input :min="0" type="number" controls-position="right" v-model="form.sk" placeholder="请输入刷卡支付金额" style="--el-input-bg-color: #ecf9ff;"/>
        </el-form-item>
        <el-form-item label="现金支付" prop="xj">
          <el-input :min="0" type="number" controls-position="right" v-model="form.xj" placeholder="请输入现金支付金额" style="--el-input-bg-color: #ecf9ff;"/>
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

<script setup name="GiftCardSellRecord">
import { listGiftCardSellRecord, getGiftCardSellRecord, delGiftCardSellRecord, addGiftCardSellRecord, updateGiftCardSellRecord } from "@/api/reservation/giftCardSellRecord";
import {listGiftCardTypeInfo} from '@/api/reservation/giftCardTypeInfo.js'
import {addCostomInfo, listCostomInfo} from "@/api/reservation/costomInfo.js";
import {ElMessage} from "element-plus";

const { proxy } = getCurrentInstance();
const { sys_gift_card_status } = proxy.useDict('sys_gift_card_status');

const giftCardSellRecordList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const giftCardType=ref([])

const customOptions=ref([])
let customOptionFilter=[]




listGiftCardTypeInfo({pageNum: 1,pageSize: 9000}).then(res=>{
  res.rows.forEach(e=>e.giftCardTypeId=e.giftCardTypeId+'')
  giftCardType.value=res.rows
  console.log('打印会员卡类型',res.rows)
})

const filterCardTypeName=function (row){
  let gitCardInfo=giftCardType.value.find(e=>e.giftCardTypeId==row)
  return gitCardInfo?gitCardInfo.giftCardTypeName:''
}


const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    customNickName:null,
    giftCardType: null,
    giftCardCode: null,
    status: null,
    sellDate:null
  },
  rules: {
    giftCardType: [
      {required: true, message: "会员卡类型不能为空", trigger: "change"}
    ],
    giftCardCode: [
      {required: true, message: "会员卡编号不能为空", trigger: "blur"}
    ],
    giftCardSellPrice: [
      {required: true, message: "会员卡出售价格不能为空", trigger: "blur"}
    ],
    giftCardDeductionPrice: [
      {required: true, message: "会员卡抵扣价格不能为空", trigger: "blur"}
    ],
  },
  customForm:{customPhone:null,customNickName:null},
  customFormRules:{
    customPhone: [{ required: true, message: "客户电话不能为空", trigger: "blur" }],
    customNickName:[{ required: true, message: "客户姓名不能为空", trigger: "blur" }],
  },
  });

const { queryParams, form, rules,customForm,customFormRules } = toRefs(data);

watch(()=>form.value.giftCardType,(value)=>{
  if(value){
    // 新增才赋值默认值
    let giftCardTypeItem= giftCardType.value.find(e=>e.giftCardTypeId==value)
    if(giftCardTypeItem){
      // 将默认值赋给表单
      form.value.giftCardSellPrice=giftCardTypeItem.giftCardSellPrice
      form.value.giftCardDeductionPrice=giftCardTypeItem.giftCardDeductionPrice
      console.log('form.value',form.value,giftCardTypeItem)
    }
  }


},{deep:true,immediate:true})


/** 查询会员卡出售记录列表 */
function getList() {
  loading.value = true;
  listGiftCardSellRecord(queryParams.value).then(response => {
    giftCardSellRecordList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 获取礼品卡列表
async function getCustomList(){
  await listCostomInfo({pageNum:1,pageSize: 9000}).then(res=>{
    customOptions.value=res.rows
    customOptionFilter=res.rows
  })
}
// 新增客户
function submitAddCustomForm(){
  proxy.$refs["costomInfoRef"].validate(valid => {
    if (valid) {
      addCostomInfo(customForm.value).then(async (response) => {
        await getCustomList();
        form.value.customId=response.data.customId
        proxy.$modal.msgSuccess("新增客户成功")
      });
    }
  });
}
// 记录搜索客户关键词,用于填充新增客户表单
function filterCustom(value){
  console.log('filterCustom',value)
  if (!value) customOptions.vaue=customOptionFilter.vaue;
  customForm.value={customPhone:value,customNickName:value }
  customOptions.value=customOptionFilter.filter(e=>(e.customNickName.indexOf(value)>-1 || e.customPhone.indexOf(value)>-1))
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
    giftCardType: '1',
    giftCardCode: null,
    giftCardSellPrice: null,
    customId:null,
    giftCardDeductionPrice: null,
    createTime: null,
    createBy: null,
    dz:null,
    sk:null,
    xj:null
  };
  proxy.resetForm("giftCardSellRecordRef");
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
  title.value = "添加会员卡出售记录";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getGiftCardSellRecord(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改会员卡出售记录";
  });
}

/** 提交按钮 */
function submitForm() {

  proxy.$refs["giftCardSellRecordRef"].validate(valid => {
    if (valid) {
      if(Number(form.value.xj?form.value.xj:0)+Number(form.value.sk?form.value.sk:0)+Number(form.value.dz?form.value.dz:0)!==Number(form.value.giftCardSellPrice)){
        proxy.$modal.msgWarning("支付金额与出售金额不一致");
        return
      }
      let payParams=[]
      if(Number(form.value.xj)){
        payParams.push({ giftCardCode: form.value.giftCardCode, giftCardPayType:'现金支付',giftCardPayAmount: form.value.xj})
      }
      if(Number(form.value.sk)){
        payParams.push({ giftCardCode: form.value.giftCardCode, giftCardPayType:'刷卡支付',giftCardPayAmount: form.value.sk})
      }

      if(Number(form.value.dz)){
        payParams.push({ giftCardCode: form.value.giftCardCode, giftCardPayType:'电子支付',giftCardPayAmount: form.value.dz})
      }

      form.value.giftCardOrder=payParams
      console.log('打印未验证时的表单',form.value)
      if (form.value.id != null) {
        updateGiftCardSellRecord(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addGiftCardSellRecord(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除会员卡出售记录编号为"' + _ids + '"的数据项？').then(function() {
    return delGiftCardSellRecord(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('reservation/giftCardSellRecord/export', {
    ...queryParams.value
  }, `giftCardSellRecord_${new Date().getTime()}.xlsx`)
}
getCustomList()
getList();
</script>
