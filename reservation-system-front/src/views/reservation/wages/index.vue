<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="工资月份" prop="wagesTime">
        <el-date-picker
            v-model="queryParams.wagesTime"
            type="month"
            placeholder="请选择日期"
            format="YYYY-MM"
            value-format="YYYY-MM"
        />
      </el-form-item>
      <el-form-item label="员工姓名" prop="nickName">
      <el-input
          v-model="queryParams.nickName"
          placeholder="请输入员工姓名"
          clearable
          @keyup.enter="handleQuery"
      />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

<!--    <el-row :gutter="10" class="mb8">-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['reservation:giftCardOrder:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>-->
<!--    </el-row>-->

    <el-table v-loading="loading" :data="EmployeeWagesList" empty-text="暂无数据">
      <el-table-column label="工资时间" align="center" prop="wagesTime" />
      <el-table-column label="员工姓名" align="center" prop="nickName"/>
      <el-table-column label="工资金额" align="center" prop="wagesMoney" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handerDetail(scope.row)">详情</el-button>
          <el-button link type="primary" icon="Edit" @click="handerServiceStatistics(scope.row,'M')">服务统计</el-button>
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

    <el-dialog v-model="wagesDetailDailogVisiable" width="800px" title="工资详情">
      <el-table v-loading="loading" :data="employeeWagesDetailList"  empty-text="暂无数据" style="height: 500px;overflow-y: scroll">
        <el-table-column label="工资时间" align="center" prop="wagesTime" />
        <el-table-column label="员工姓名" align="center" prop="nickName"/>
        <el-table-column label="工资金额" align="center" prop="wagesMoney" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template #default="scope">
            <el-button link type="primary" icon="Edit" @click="handerServiceStatistics(scope.row)">服务统计</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog v-model="serviceStatisticsDailogVisiable" width="800px" title="服务统计">
      <el-table v-loading="loading" :data="serviceStatisticsList"  empty-text="暂无数据" :span-method="arraySpanMethod" style="height: 500px;overflow-y: scroll">
        <el-table-column label="服务" align="center" prop="serviceGroup" />
        <el-table-column label="支付类型" align="center" prop="payType"/>
        <el-table-column label="支付金额" align="center" prop="payAmount" />
        <el-table-column label="数量" align="center" prop="count" />
        <el-table-column label="工资" align="center" prop="serviceWages">
          <template #default="scope">
            <span>{{scope.row.count*scope.row.serviceWages}}元</span>
          </template>

        </el-table-column>
      </el-table>
    </el-dialog>

  </div>
</template>

<script setup name="Wages">
import { listEnployeeWages} from "@/api/reservation/employeeWages.js";
import {listServiceStatistics} from "@/api/reservation/serviceStatistics.js";
import moment from 'moment'
import _ from 'lodash'

const { proxy } = getCurrentInstance();

const EmployeeWagesList = ref([]);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const wagesDetailDailogVisiable=ref(false)
const serviceStatisticsDailogVisiable=ref(false)
const employeeWagesDetailList = ref([]);
const serviceStatisticsList=ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    wagesTimeType:'M',
    nickName:null,
    wagesTime:moment().format('YYYY-MM')
  },
  queryDetailParams: {
    pageNum: 1,
    pageSize: 1000
  },
  queryServiceStatisticsParams: {
    pageNum: 1,
    pageSize: 1000
  },
  rules: {
  }
});

const { queryParams, form, rules,queryDetailParams } = toRefs(data);

/** 查询礼品卡订单记录列表 */
function getList() {
  loading.value = true;
  listEnployeeWages(queryParams.value).then(response => {
    EmployeeWagesList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
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

/** 导出按钮操作 */
function handleExport() {
  proxy.download('reservation/enployeeWages/export', {
    ...queryParams.value
  }, `工资表_${new Date().getTime()}.xlsx`)
}


function handerDetail(row){
  loading.value=true
  listEnployeeWages({...queryDetailParams.value,...row}).then(response => {
    employeeWagesDetailList.value = response.rows;
    loading.value = false;
    wagesDetailDailogVisiable.value=true
  });
}

function handerServiceStatistics(row,type){
  loading.value=true
  listServiceStatistics({...queryDetailParams.value,...row,payTime:row.wagesTime,pageTimeType:type}).then(response => {

    response.rows.forEach((e,index)=>{
      if(e.cardId.indexOf(',')>0){
        // 将行数据拆分成数组
        let item=_.cloneDeep(e)
        console.log('item',item,e)
        let cardGroup=e.cardId.split(',')
        console.log('item',cardGroup)
        if(response.rows[index-1].cardId==cardGroup[0]){
          for(let i=cardGroup.length-1;i>=0;i--){

            item.cardId=cardGroup[i]
            item.count=1
            // alert(index+1)
            console.log('itemitemitem',_.cloneDeep(item));
            response.rows.splice(index+1,0,_.cloneDeep(item))
          }
          response.rows.splice(index,1)
        }
      }
    })

    console.log('response.rows',response.rows)
    let cardGroup=_.groupBy(response.rows,'cardId')

    let keyArray=[]
    for(let key in cardGroup){
      keyArray.push(JSON.stringify(cardGroup[key].map(item=>item.serviceGroup+"-"+item.payType+"-"+item.payAmount)))
    }

    let cardGroup1=_.countBy(keyArray)


    let keyLengthEG1Array=[]
    for(let key in cardGroup1){
      if(cardGroup1[key]>1){
        keyLengthEG1Array.push(key)
      }
    }

    console.log('cardGroup1',cardGroup1,keyLengthEG1Array)
    let replace={}
    let delArray=[]
    for(let i=0;i<keyLengthEG1Array.length;i++){
      let array=[]
      for(let key in cardGroup){
         if(JSON.stringify(cardGroup[key].map(item=>item.serviceGroup+"-"+item.payType+"-"+item.payAmount))===keyLengthEG1Array[i]){
           array.push(key)
         }
      }

      let cradId=array.shift()
      delArray=delArray.concat(array)
      console.log('array',array,delArray)
      replace[cradId]=cardGroup1[keyLengthEG1Array[i]]
    }
    replace['delCardIds']=delArray
    // 判断是否有相同支付类型并且各种支付类型都相同的数据，如果由则取其中一个并且数量+1


    for(let i=response.rows.length-1;i>=0;i--){
      if(replace[response.rows[i].cardId]){
        response.rows[i].count=replace[response.rows[i].cardId]
      }
      if(replace['delCardIds'].includes(response.rows[i].cardId)){
        // alert(response.rows[i].cardId)
        response.rows.splice(i,1)
      }
    }
    console.log('打印需要重新统计的card组和删除的card组',replace,response.rows)




    let map={}
    response.rows.forEach((e,index)=>{

      let len=cardGroup[e.cardId].length
      if(len>0 && !map.hasOwnProperty(e.cardId)){
        map[e.cardId]=len
        e['rowSpan']=len
      }
    })
    serviceStatisticsList.value = response.rows;
    console.log(serviceStatisticsList.value);
    loading.value = false;
    serviceStatisticsDailogVisiable.value=true
  });
}


const arraySpanMethod = ({
                           row,
                           column,
                           rowIndex,
                           columnIndex,
                         }) => {
  if (columnIndex === 0 || columnIndex === 3 || columnIndex === 4) {
    if(row.hasOwnProperty('rowSpan')){
      console.log('1111111',row,column,rowIndex,columnIndex)
      let rowSpan=row['rowSpan']
      // alert(rowSpan)
      // delete row['rowSpan']
      return {
        rowspan:rowSpan,
        colspan:1
      }
    }else{
      return {
        rowspan:0,
        colspan:0
      }
    }

  }
}
getList();
</script>
