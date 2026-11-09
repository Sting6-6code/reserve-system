<template>
  <div class='demo-app' id="app-main">

    <!-- 结账弹框 -->
    <FormDrawer ref="formDrawerRef" :title="drawerTitle" :isShowSubmitBtn="true" @submit="handleSubmit">
      <el-form :model="payForm" :rules="payFormRules" ref="formRef" label-width="120px">

        <el-form-item label="支付详情" prop="serviceGroup">
          <div style="width: 100%;word-wrap: break-word">
            <span v-for="(sevice,index) in currentRow.row[currentRow.column.property].serviceList" :key="index" >
              <el-tag type="success">{{ sevice.serviceName}}x{{sevice.servicePrice}}元
              </el-tag>
              <span>&nbsp;</span>
            </span>

          </div>
        </el-form-item>
        <el-form-item label="支付金额" prop="payAmount" required>
          <el-input v-model="payForm.payAmount"></el-input>
        </el-form-item>
        <el-divider>
          <el-icon class="el-icon--left"><Money /></el-icon>支付方式
        </el-divider>
        <el-form-item label="Venmo" prop="dz">
          <el-input :min="0" type="number" controls-position="right" v-model="payForm.dz" placeholder="请输入电子支付金额"/>
        </el-form-item>
        <el-form-item label="刷卡" prop="sk">
          <el-input :min="0" type="number" controls-position="right" v-model="payForm.sk" placeholder="请输入刷卡支付金额"/>
        </el-form-item>
        <el-form-item label="现金" prop="xj">
          <el-input :min="0" type="number" controls-position="right" v-model="payForm.xj" placeholder="请输入现金支付金额"/>
        </el-form-item>
        <el-form-item label="会员卡" prop="lpk">
          <el-input v-model="payForm.lpk" placeholder="请输入会员卡支付" />
        </el-form-item>
<!--        <el-form-item label="会员卡编号" prop="lpk">-->
<!--          <el-input v-model="payForm.lpkCode" placeholder="请输入会员卡编号"/>-->
<!--        </el-form-item>-->
<!--        <h class="pay-tip" style="color: #d7a875">兑换多个会员卡请用,分离开,例如[001,002]</h>-->

<!--        <div v-if="payForm.successToolTip" class="pay-tip success-tip">-->
<!--          {{payForm.successToolTip}}-->
<!--        </div>-->

<!--        <div v-if="payForm.errorToolTip" class="pay-tip error-tip">-->
<!--          {{payForm.errorToolTip}}-->

<!--        </div>-->



      </el-form>
    </FormDrawer>

    <!-- 增加卡片弹窗 -->
    <FormDrawer ref="cardInfoFormDrawerRef" :title="cardInfoFormDrawerTitle" :isShowSubmitBtn="true" @submit="handleAddCradFormSubmit">
      <el-form :model="addCardInfoForm" ref="addCradInfoFormRel" :rules="addCardInfoFormRule" label-width="80px">
        <el-form-item label="预约时间" prop="start" required>
          <el-date-picker
              v-model="addCardInfoForm.start"
              type="datetime"
              placeholder="请选择预约时间"
              format="YYYY-MM-DD HH:mm:ss"
              value-format="YYYY-MM-DD HH:mm:ss"
              :disabled-date="disabledCardStart"
              @change="handleCradStartDatePick"
          />
        </el-form-item>
<!--        <el-form-item label="预约名称" prop="cardName" required>-->
<!--          <el-input v-model="addCardInfoForm.cardName" placeholder="请选择预约名称"> </el-input>-->
<!--        </el-form-item>-->
        <el-form-item label="预约客户" prop="customId" required>
          <el-select
              v-model="addCardInfoForm.customId"
              :multiple="false"
              filterable
              default-first-option
              value-key="customId"
              :reserve-keyword="false"
              placeholder="请输入客户名称或手机号"
              :filter-method="filterCustom"
              @change="handleAddCardCustomIdChange"
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
        <el-form-item label="预约服务" required prop="selectServiceList">
          <el-tree-select
              v-model="addCardInfoForm.selectServiceList"
              :data="serviceTree"
              multiple
              value-key="id"
              clearable
              :render-after-expand="false"
              :default-expand-all="true"
              show-checkbox
              check-strictly
              :filter-node-method="filterNodeMethod"
              filterable
              no-match-text="无法匹配数据"
              no-data-text="暂无数据"
              loading-text="加载中，请稍候"
              :automatic-dropdown="true"
              :props="{disabled: filterDisable}"
          />
<!--          <el-tree-->
<!--              class="tree-border"-->
<!--              :data="serviceTree"-->
<!--              show-checkbox-->
<!--              ref="serviceTreeRef"-->
<!--              node-key="id"-->
<!--              empty-text="加载中，请稍候"-->
<!--              :default-expand-all="true"-->
<!--              :props="{ label: 'label', children: 'children',disabled: filterDisable}"-->
<!--              style="display: none"-->
<!--          ></el-tree>-->
        </el-form-item>
        <el-form-item label="预约人数" prop="cardNum" required>
          <el-input-number
              v-model="addCardInfoForm.cardNum"
              :min="1"
              size="small"
              controls-position="right"
              @change="handleCardNumChange"
          />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input
              v-model="addCardInfoForm.remark"
              type="textarea"
              style="width:217px"
          />
        </el-form-item>
        <!-- 客户跟踪信息 -->
        <el-form-item v-if="addCardHistoryInfo.firstServiceDate || addCardHistoryInfo.latestServiceName" label="客户跟踪" style="margin-top: 10px;">
          <div style="width: 217px; font-size: 12px; color: #606266; line-height: 1.8;">
            <div v-if="addCardHistoryInfo.firstServiceDate" style="margin-bottom: 5px;">
              <span style="font-weight: 500;">首次服务日期：</span>{{ addCardHistoryInfo.firstServiceDate }}
            </div>
            <div v-if="addCardHistoryInfo.latestServiceName || addCardHistoryInfo.latestEmployeeName || addCardHistoryInfo.latestServiceDate">
              <span style="font-weight: 500;">最近服务：</span>
              <span v-if="addCardHistoryInfo.latestServiceDate" style="margin-right: 8px;">{{ addCardHistoryInfo.latestServiceDate }}</span>
              <span v-if="addCardHistoryInfo.latestServiceName">{{ addCardHistoryInfo.latestServiceName }}</span>
              <span v-else-if="!addCardHistoryInfo.latestServiceDate">无服务记录</span>
              <span v-if="addCardHistoryInfo.latestEmployeeName" style="margin-left: 8px;">
                (技师：{{ addCardHistoryInfo.latestEmployeeName }})
              </span>
            </div>
          </div>
        </el-form-item>
      </el-form>
    </FormDrawer>




    <!-- 修改卡片弹窗 -->
    <FormDrawer ref="cardInfoUpdateFormDrawerRef" :title="cardInfoFormUpdateDrawerTitle" :isShowSubmitBtn="true" @submit="handleUpdateCradFormSubmit">

      <el-form :model="updateCardInfoForm" ref="updateCradInfoFormRel" :rules="updateCardInfoFormRule" label-width="80px">
        <el-button size="small" style="width: 100%;height: 36px;background: #65f06a;margin: 15px 0;color: white" @click="handleCradFormDelete">删除卡片</el-button>
        <el-form-item label="预约时间" prop="start" required>
          <el-date-picker
              v-model="updateCardInfoForm.start"
              type="datetime"
              placeholder="请选择预约时间"
              format="YYYY-MM-DD HH:mm:ss"
              value-format="YYYY-MM-DD HH:mm:ss"
              :disabled-date="disabledCardStart"
              @change="handleCradStartDatePickInUpdate"
          />
        </el-form-item>
        <!--        <el-form-item label="预约名称" prop="cardName" required>-->
        <!--          <el-input v-model="addCardInfoForm.cardName" placeholder="请选择预约名称"> </el-input>-->
        <!--        </el-form-item>-->
        <el-form-item label="预约客户" prop="customId" required>
          <el-select
              v-model="updateCardInfoForm.customId"
              :multiple="false"
              filterable
              default-first-option
              value-key="customId"
              :reserve-keyword="false"
              placeholder="请输入客户名称或手机号"
              :filter-method="filterCustom"
              @change="handleUpdateCardCustomIdChange"
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
        <el-form-item label="预约服务" required prop="selectServiceList">
          <el-tree-select
              v-model="updateCardInfoForm.selectServiceList"
              :data="serviceTree"
              multiple
              value-key="id"
              clearable
              :render-after-expand="false"
              :default-expand-all="true"
              show-checkbox
              check-strictly
              :filter-node-method="filterNodeMethod"
              filterable
              no-match-text="无法匹配数据"
              no-data-text="暂无数据"
              loading-text="加载中，请稍候"
              :automatic-dropdown="true"
              :props="{disabled: filterDisable}"
          />
          <!--          <el-tree-->
          <!--              class="tree-border"-->
          <!--              :data="serviceTree"-->
          <!--              show-checkbox-->
          <!--              ref="serviceTreeRef"-->
          <!--              node-key="id"-->
          <!--              empty-text="加载中，请稍候"-->
          <!--              :default-expand-all="true"-->
          <!--              :props="{ label: 'label', children: 'children',disabled: filterDisable}"-->
          <!--              style="display: none"-->
          <!--          ></el-tree>-->
        </el-form-item>
        <el-form-item label="绑定员工">
          <el-select v-model="updateCardInfoForm.employeeId" value-key="employeeId" placeholder="选择员工">
            <el-option :label="item.nickName" :value="item.employeeId" v-for="(item,index) in employeeList" :key="index">
            </el-option>
<!--            <el-option label="区域二" value="beijing"></el-option>-->
          </el-select>
        </el-form-item>
<!--        <el-form-item label="预约人数" prop="cardNum" required >-->
<!--          <el-input-number-->
<!--              v-model="updateCardInfoForm.cardNum"-->
<!--              :min="1"-->
<!--              size="small"-->
<!--              controls-position="right"-->
<!--              @change="handleCardNumChange"-->
<!--              disabled-->
<!--          />-->
<!--        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input
              v-model="updateCardInfoForm.remark"
              type="textarea"
              style="width:217px"
          />
        </el-form-item>
        <!-- 客户跟踪信息 -->
        <el-form-item v-if="updateCardHistoryInfo.firstServiceDate || updateCardHistoryInfo.latestServiceName" label="客户跟踪" style="margin-top: 10px;">
          <div style="width: 217px; font-size: 12px; color: #606266; line-height: 1.8;">
            <div v-if="updateCardHistoryInfo.firstServiceDate" style="margin-bottom: 5px;">
              <span style="font-weight: 500;">首次服务日期：</span>{{ updateCardHistoryInfo.firstServiceDate }}
            </div>
            <div v-if="updateCardHistoryInfo.latestServiceName || updateCardHistoryInfo.latestEmployeeName || updateCardHistoryInfo.latestServiceDate">
              <span style="font-weight: 500;">最近服务：</span>
              <span v-if="updateCardHistoryInfo.latestServiceDate" style="margin-right: 8px;">{{ updateCardHistoryInfo.latestServiceDate }}</span>
              <span v-if="updateCardHistoryInfo.latestServiceName">{{ updateCardHistoryInfo.latestServiceName }}</span>
              <span v-else-if="!updateCardHistoryInfo.latestServiceDate">无服务记录</span>
              <span v-if="updateCardHistoryInfo.latestEmployeeName" style="margin-left: 8px;">
                (技师：{{ updateCardHistoryInfo.latestEmployeeName }})
              </span>
            </div>
          </div>
        </el-form-item>
      </el-form>
    </FormDrawer>






    <!--设置余额弹窗-->
    <el-dialog v-model="setCashBalanceDailogVisiable" width="500px" title="设置余额" style="width:400px;margin: auto">
      <el-form ref="incomeInfoRef" :model="incomeInfoForm" :rules="incomeInfoFormRules" label-width="120px" style="margin: auto">
        <el-form-item label="支出时间" prop="date">
          <el-date-picker disabled
                          v-model="incomeInfoForm.date"
                          type="date"
                          placeholder="请选择支出时间"
                          size="small"
                          format="YYYY-MM-DD"
                          value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="上班前现金余额" prop="balanceBeforeWork">
          <el-input v-model="incomeInfoForm.balanceBeforeWork" size="small" style="width: 220px" type="number" placeholder="请输入上班前现金余额" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitIncomeForm">确 定</el-button>
          <el-button @click="setCashBalanceDailogVisiable=false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!--设置cc弹窗-->
    <el-dialog v-model="setCCDailogVisiable" width="500px" title="设置cc" style="width:400px;margin: auto">
      <el-form ref="setCCFormRef" :model="setCCForm" :rules="setCCFormRules" label-width="120px" style="margin: auto">
        <el-form-item label="设置时间" prop="date">
          <el-date-picker disabled
                          v-model="setCCForm.date"
                          type="date"
                          placeholder="请选择支出时间"
                          size="small"
                          format="YYYY-MM-DD"
                          value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="pos机金额" prop="cc">
          <el-input v-model="setCCForm.cc" size="small" style="width: 220px" type="number" placeholder="请输入pos机金额" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitSetCCForm">确 定</el-button>
          <el-button @click="setCCDailogVisiable=false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!--支出弹窗-->
    <el-dialog v-model="payOutDailogVisiable" width="500px" append-to-body title="支出" style="width:400px;margin: auto">
      <el-form ref="payOutInfoRef" :model="payOutForm" :rules="payOutFormRules" label-width="80px">
        <el-form-item label="支出时间" prop="payOutTime">
          <el-date-picker disabled
              v-model="payOutForm.payOutTime"
              type="date"
              placeholder="请选择支出时间"
              size="small"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="支出金额" prop="payOutAmount">
          <el-input type="number" size="small" style="width: 220px" v-model="payOutForm.payOutAmount" placeholder="请输入支出金额" />
        </el-form-item>
        <el-form-item label="支出类型" prop="payOutType">
          <el-select
              v-model="payOutForm.payOutType"
              clearable
              size="small"
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
        <el-form-item label="支出原因" prop="reason" v-if="payOutForm.payOutType=='其它'">
          <el-input v-model="payOutForm.reason" placeholder="请输入支出原因"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitPayOutForm">确 定</el-button>
          <el-button @click="payOutDailogVisiable=false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
    <!--结算弹窗-->
    <el-dialog v-model="settlementDailogVisiable" title="结算">
      <div>日期:{{selectDate}}</div>
      <el-row>
        <el-col :span="12">
<!--          <p>预约现金收入:{{cardPayAmount.xj}}元</p>-->
<!--          <p>会员卡现金收入:{{giftCardPayAmount.xj}}元</p>-->
<!--          <p>支出费用:{{payOutAmount.total}}元</p>-->
          <p>现金收入:{{(cardPayAmount.xj+giftCardPayAmount.xj-payOutAmount.total)?(cardPayAmount.xj+giftCardPayAmount.xj-payOutAmount.total):0}}元</p>
        </el-col>
        <el-col :span="12">
          <p>总收入:{{cardPayAmount.total+giftCardPayAmount.total-(cardPayAmount.total-cardPayAmount.xj-cardPayAmount.dz-cardPayAmount.sk)}}元</p>
          <p>CC:{{incomeInfo.cc?incomeInfo.cc:0}}元</p>
          <p>杂费:{{payOutAmount.qtxf}}元</p>
          <p>Venmo小费:{{payOutAmount.venmoxf}}元</p>
<!--          <p>刷卡小费:{{payOutAmount.skxf}}元</p>-->
<!--          <p>会员卡刷卡支付:{{giftCardPayAmount.sk}}元</p>-->
          <p>会员卡电子支付:{{giftCardPayAmount.dz}}元</p>
          <p>预约卡片电子支付:{{cardPayAmount.dz}}元</p>
          <el-divider class="divider-js">
          </el-divider>
          <p>现金收入:{{cardPayAmount.total+giftCardPayAmount.total-(cardPayAmount.total-cardPayAmount.xj-cardPayAmount.dz-cardPayAmount.sk)-(incomeInfo.cc?incomeInfo.cc:0)-payOutAmount.qtxf-payOutAmount.venmoxf-cardPayAmount.dz-giftCardPayAmount.dz}}元</p>
        </el-col>
      </el-row>
      <div style="height:36px;width: 100%;display:flex;justify-content: center;align-items: center;" v-if="(cardPayAmount.total+giftCardPayAmount.total-(cardPayAmount.total-cardPayAmount.xj-cardPayAmount.dz-cardPayAmount.sk)-(incomeInfo.cc?incomeInfo.cc:0)-payOutAmount.qtxf-payOutAmount.venmoxf-cardPayAmount.dz-giftCardPayAmount.dz)===(cardPayAmount.xj+giftCardPayAmount.xj-payOutAmount.total)">
        <el-button size="small" type="primary" @click="workerEnd">收工</el-button>
      </div>

    </el-dialog>

    <!--会员卡出售弹窗-->
    <el-dialog v-model="sellGiftCardDailogVisiable" width="80%" title="会员卡出售" @closed="refreshShowData">
      <giftCardSellRecord></giftCardSellRecord>
    </el-dialog>



    <div class="top-toolbar-boxer">
      <div class="top-toolbar-left" :style="{background:!isToday()?'rgb(48 65 86)':''}"><el-button type="info" size="small" class="cancel-button-style">{{isToday()?selectDate+'(今天)':selectDate}}</el-button></div>
      <div class="top-toolbar-right">
        <el-button type="info" size="small" class="cancel-button-style"  @click="setCashBalance"><el-icon class="el-icon--left"><Money /></el-icon>上班前现金余额:{{incomeInfo.balanceBeforeWork?incomeInfo.balanceBeforeWork:0}}元<el-icon><Setting /></el-icon></el-button>
        <span>+</span>
        <el-button type="info" size="small" class="cancel-button-style" @click="sellGiftCard"><el-icon class="el-icon--left"><Money /></el-icon>当天会员卡出售收入现金:{{giftCardPayAmount.xj?giftCardPayAmount.xj:0}}元&nbsp;(会员卡出售<el-icon><Setting /></el-icon>)</el-button>
        <span>+</span>
        <el-button type="info" size="small" class="cancel-button-style" ><el-icon class="el-icon--left"><Money /></el-icon>当天预约收入现金:{{cardPayAmount.xj?cardPayAmount.xj:0}}元<el-icon><Setting /></el-icon></el-button>
        <span>-</span>
        <el-button type="info" size="small" class="cancel-button-style" @click="handerPayOut"><el-icon class="el-icon--left"><Money /></el-icon>当天支出现金:{{payOutAmount.total?payOutAmount.total-payOutAmount.skxf:0}}元<el-icon><Setting /></el-icon></el-button>
        <span>=</span>
        <el-dropdown>
          <el-button type="info" size="small" class="cancel-button-style">
            <el-icon class="el-icon--left"><Money /></el-icon>下班前余额:{{currentCashBalance}}元
          </el-button>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="handerPayOut">支出</el-dropdown-item>
              <el-dropdown-item @click="handerSetCC">结算</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
    <div id="container-top" class='demo-app-main-top'>
      <el-table :data="tableData" style="width: 100%;height: 100%;" header-row-class-name="head_bg"
                @cell-mouse-leave="leaveSelectionRows" @cell-mouse-enter="enterSelectionRows" :border="true" id="table">

        <el-table-column :prop="employee.employeeId+''" v-for="(employee,index) in employeeList" :key="index" :employeeId="employee.employeeId" :min-width="200">
          <template #header="{ column, $index }" >
            <el-popover
                placement="bottom"
                title="员工资料"
                :width="200"
                trigger="click"
            >
              <el-card :body-style="{ padding: '5px' }">
                <img
                    :src="getImageRealPath(employee.coverImage)"
                    class="appover_image"
                />
                <div style="display: flex;justify-content: center;align-items: center;width: 100%">
                  <el-button text class="button">修改资料</el-button>
                </div>
              </el-card>
              <template #reference>
                <div class="header_title"><el-avatar :size="25" :src="getImageRealPath(employee.coverImage)"/>&nbsp;{{employee.nickName}}</div>
              </template>
            </el-popover>

          </template>
          <template #default="{ row, column, $index }">
            <div v-if="row[employee.employeeId]">
              <el-card :class="row[employee.employeeId].orderStatus!='1'?'isPay':'unPay'" style="margin: auto" @click="handleUpdateEvent(row[employee.employeeId].cardId)">
                <template #header>
                  <div class="card_header">
                    <span>{{row[employee.employeeId].cardName}}</span>
                    <el-button size="small" :disabled="row[employee.employeeId].orderStatus!='1'" type="info" :style="{background:'transparent',border:'none',color:row[employee.employeeId].orderStatus!='1'?'':'red'}" @click.stop="toPay(row,column)">{{row[employee.employeeId].orderStatus!='1'?'已付款':'未付款'}}</el-button>
                  </div>
                </template>
                <div class="service_container">
                  <div class="service_title" :style="{color:row[employee.employeeId].orderStatus!='1'?'#fff':'#ac9a9a'}">预约服务</div>
                  <div class="service_body" :style="{color:row[employee.employeeId].orderStatus!='1'?'#fff':'#ac9a9a'}">
                    <el-tag v-for="(sevice,index) in row[employee.employeeId].serviceList" :key="index" type="success" class="service_body_tag">{{ sevice.serviceName}}</el-tag>
                  </div>
                </div>

                <template #footer>
                  <p class="sevice_footer" :style="{color:row[employee.employeeId].orderStatus!='1'?'#fff':'#ac9a9a',textAlign:'left'}">预约时间</p>
                  <div style="display: flex;justify-content: center;align-items: center;flex-direction: column">
                    <span>开始:{{row[employee.employeeId].start}}</span>
                    <span>结束:{{row[employee.employeeId].end}}</span>
                  </div>
                </template>
              </el-card>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>

<!--    <div id="dragtest" draggable="true" @dragstart="dragStart"></div>-->
    <div id="dragLine" style="width: 100%;height:5px;background: #58aaff6b"></div>
    <div class="toolbar-boxer">
      <el-date-picker
          v-model="selectDate"
          type="date"
          :clearable="false"
          placeholder="请选择日期"
          :shortcuts="shortcuts"
          size="small"
          format="YYYY-MM-DD"
          value-format="YYYY-MM-DD"
          @change="handleDatePick"
      />

      <div class="toolbar-right">
        <el-button type="primary" @click="handleAddEvent" size="small">增加卡片</el-button>
      </div>
    </div>
    <div id="container-bottom" class='demo-app-main-bottom'>
      <FullCalendar
          ref="fullCalendar"
          id="fullCalendar"
          :options='calendarOptions'
      >
        <template v-slot:eventContent='arg'>
          <div :resource-id="arg.event.extendedProps.cardId" :style="{color:arg.event.extendedProps.isPay?'#fff':'#ac9a9a'}" class="line_card">
            <div :resource-id="arg.event.extendedProps.cardId" v-if="arg.event.extendedProps.hasOwnProperty('resourceMark')">
              <div :resource-id="arg.event.extendedProps.cardId" style="display: flex;justify-content: flex-start;align-items: center;width:100%;height:18px">
                <P :resource-id="arg.event.extendedProps.cardId">{{arg.event.extendedProps.name}}</P>
              </div>
            </div>
            <el-popover
                placement="bottom"
                title="预约卡片"
                :width="200"
                :trigger="cardPopoverTrigger"
                :resource-id="arg.event.extendedProps.cardId"
                v-else
            >
              <el-card :resource-id="arg.event.extendedProps.cardId" style="width: 100%;height: 100%;" :class="arg.event.extendedProps.orderStatus!='1'?'isPay fc-event-test':'unPay fc-event-test'" >
                <template #header>
                  <div class="card_header" :resource-id="arg.event.extendedProps.cardId" :class="arg.event.extendedProps.orderStatus!='1'?'isPay':'unPay'">
                    <span :resource-id="arg.event.extendedProps.cardId">{{arg.event.extendedProps.cardName}}</span>
                    <span :resource-id="arg.event.extendedProps.cardId">{{arg.event.extendedProps.orderStatus!='1'?'已支付':'未支付'}}</span>
                  </div>
                </template>
                <div :resource-id="arg.event.extendedProps.cardId" class="service_container" style="height: 54px;overflow-y: scroll;overflow-x: hidden">
                  <div :resource-id="arg.event.extendedProps.cardId" class="service_title" :style="{color:arg.event.extendedProps.orderStatus!='1'?'#fff':'#ac9a9a'}">预约服务</div>
                  <div :resource-id="arg.event.extendedProps.cardId" style="word-wrap: break-word">
                    <span resource-id="arg.event.extendedProps.cardId" v-for="(sevice,index) in arg.event.extendedProps.serviceList" :key="index" >
                      <el-tag resource-id="arg.event.extendedProps.cardId" type="success">{{ sevice.serviceName}}</el-tag><span style="padding-left: 2px;"></span>
                    </span>
                  </div>
                </div>
                <template #footer>


                  <p :resource-id="arg.event.extendedProps.cardId" class="sevice_footer" :style="{color:arg.event.extendedProps.employeeId?'red':'#ac9a9a'}" style="border-bottom: 1px solid var(--el-card-border-color);margin:0;line-height: 48px;height: 48px">{{filterEmployeeName(arg.event.extendedProps.employeeId)}}</p>
                  <div :resource-id="arg.event.extendedProps.cardId" class="service_container" style="line-height: 18px;border-bottom: 1px solid var(--el-card-border-color);">
                    <p :resource-id="arg.event.extendedProps.cardId">预约时间</p>
                    <p :resource-id="arg.event.extendedProps.cardId" style="padding: 0 5px;margin:0;">开始:{{formatDate(arg.event.start,'YYYY-MM-DD HH:mm:ss')}}</p>
                    <p :resource-id="arg.event.extendedProps.cardId" style="padding: 0 5px;margin:0;">结束:{{formatDate(arg.event.end,'YYYY-MM-DD HH:mm:ss')}}</p>
                  </div>
                  <div :resource-id="arg.event.extendedProps.cardId" class="service_container" style="line-height: 18px;" v-if="arg.event.extendedProps.remark">
                    <p :resource-id="arg.event.extendedProps.cardId">备注:</p>
                    <div :resource-id="arg.event.extendedProps.cardId" style="padding: 0 5px">{{arg.event.extendedProps.remark}}</div>
                  </div>

                </template>
              </el-card>
              <template #reference>
                <div :resource-id="arg.event.extendedProps.cardId" :class="arg.event.extendedProps.orderStatus!='1'?'isPay fc-event-test':'unPay fc-event-test'" @click.stop="handleUpdateEvent(arg.event.extendedProps.cardId)">
                  <div :resource-id="arg.event.extendedProps.cardId" style="width:100%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;padding: 0 2px" :style="{height:arg.event.extendedProps.remark?'18px':'36px',lineHeight:arg.event.extendedProps.remark?'18px':'36px'}">
                    {{arg.event.extendedProps.cardName}}
                  </div>
                  <div :resource-id="arg.event.extendedProps.cardId" style="height:18px;line-height:18px;color:red;font-size:12px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;padding: 0 2px" v-if="arg.event.extendedProps.remark">备注:{{arg.event.extendedProps.remark}}</div>
                </div>
              </template>

            </el-popover>



          </div>
        </template>
      </FullCalendar>
    </div>

  </div>
</template>
<script>
import { imageRealPath,isMobile } from "@/utils/validate";
import { defineComponent,h,render,} from 'vue'
import FullCalendar from '@fullcalendar/vue3'
import interactionPlugin,{ Draggable }  from '@fullcalendar/interaction'
import timeGridPlugin from '@fullcalendar/timegrid'
import resourceTimelinePlugin from '@fullcalendar/resource-timeline';
import FormDrawer from "@/components/FormDrawer/index.vue";
import moment from 'moment'
import _ from 'lodash'
import { v4 as uuidv4 } from 'uuid';
import {listEmployeeInfo} from '@/api/reservation/employeeInfo.js'
import {
  listCardInfo,
  addCardInfo,
  updateCardInfo,
  batchSaveServiceInfo,
  updateCardOrder, delCardInfo, getCustomerHistory
} from '@/api/reservation/cardInfo.js'
import {serviceTreeSelect,listServiceInfo} from '@/api/reservation/serviceInfo.js'

import { ElMessage, ElMessageBox } from 'element-plus'
import Day from "@/components/Crontab/day.vue";
import {addPayOutInfo, payOutAmount} from "@/api/reservation/payOutInfo.js";
import {addIncomeInfo,listIncomeInfo} from "@/api/reservation/incomeInfo.js";
import {listGiftCardSellRecord} from "@/api/reservation/giftCardSellRecord.js";
import giftCardSellRecord from '@/views/reservation/giftCardSellRecord'
import {giftCardPayAmount} from "@/api/reservation/giftCardOrder.js";
import {cardPayAmount} from "@/api/reservation/cardOrder.js";
import {addCostomInfo, listCostomInfo, updateCostomInfo} from "@/api/reservation/costomInfo.js";
import twilioService from "@/api/reservation/twilioService.js";
export default defineComponent({

  components: {
    Day,
    FullCalendar,
    FormDrawer,
    giftCardSellRecord
  },
  name:'CardInfo',
  data() {
    return {
      calendarOptions: {
        longPressDelay:1,
        // schedulerLicenseKey: '<xxxx-xxxxxx-xxx-xxxx-xxxx>',
        // headerToolbar: {
        //   left: 'prev,next today',
        //   center: 'title',
        //   right:''
        // },
        headerToolbar:false,
        // locale:'zh-cn',
        plugins: [ resourceTimelinePlugin,interactionPlugin,timeGridPlugin],
        initialView: 'resourceTimeline',
        slotMinTime:'9:00:00',
        slotMaxTime:'24:00:00',
        // slotDuration:'00:15:00',
        aspectRatio: 1.5,
        // initialEvents: INITIAL_EVENTS, // alternatively, use the `events` setting to fetch from a feed
        editable: false, // 是否可以进行（拖动、缩放）修改
        eventStartEditable: true, // Event日程开始时间可以改变，默认true，如果是false其实就是指日程块不能随意拖动，只能上下拉伸改变他的endTime
        eventDurationEditable: true, // Event日程的开始结束时间距离是否可以改变，默认true，如果是false则表示开始结束时间范围不能拉伸，只能拖拽
        droppable:true,
        // dropAccept: '.list-group-item',
        // drop: this.drop,
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,
        dayHeaderDidMount:this.dayHeaderContent,
        select: this.handleDateSelect,
        eventClick: this.handleEventClick,
        eventsSet: this.handleEvents,

        resourceAreaHeaderContent: '',
        resourceLabelDidMount: function(info) {
        console.log('打印第一列数据',info)
          // var questionMark = document.createElement('strong');
          // questionMark.innerText = ' (?) ';
          //
          // info.el.querySelector('.fc-datagrid-cell-main')
          //     .appendChild(questionMark);

          // var tooltip = new Tooltip(questionMark, {
          //   title: info.resource.title + '!!!',
          //   placement: 'top',
          //   trigger: 'hover',
          //   container: 'body'
          // });
        },
        resources:[],
        events:[],
        /* you can update a remote database when these fire:
        eventAdd:
        eventChange:
        eventRemove:
        */
        eventResize: this.onEventResize, // 事件时间区间调整
        eventDrop: this.onEventResize, // 事件Drag-Drop事件
        eventMouseLeave: this.eventMouseLeaveMethod, // 鼠标移出事件发生的事件
        eventDragStart:this.dragStart,
        eventDragStop:this.dragStop,
        eventResizeStop:this.eventResizeStop,
        eventChange:this.eventChange,

      },
      currentEvents: [],
      defalutTableDataSize:30,
      employeeList:[],
      // 模拟后台返回的主表数据
      tableDataFromEnd:{
        // employeeId_001:[{id:1,parentId:0,name:'客户卡片1',start:moment().format('yyyy-MM-DD')+' 10:10:10',end:moment().format('yyyy-MM-DD')+' 12:10:11',employeeId:'employeeId_001',customId:'customId_001',orderId:'order_001',isPay:true,serviceList:[{id:1,name:'舞蹈'},{id:1,name:'唱歌'}]}],
        // employeeId_002:[{id:2,parentId:1,name:'客户卡片2',start:moment().format('yyyy-MM-DD')+' 12:00:00',end:moment().format('yyyy-MM-DD')+' 20:10:00',employeeId:'employeeId_002',customId:'customId_002',orderId:'order_002',isPay:false,serviceList:[{id:3,name:'弹吉他'},{id:4,name:'煮菜'}]}]
      },
      // 模拟后台返回的卡片数据 todo 如果不想用户拖动预约时间大小,需要将events里的durationEditable设置为false,calendarOptions里的durationEditable设置为true,否则无法拖拽
      cardInfoFromEnd:[
        // {id:1,name:'客户卡片1',start:moment().format('yyyy-MM-DD')+' 10:00:00',end:moment().format('yyyy-MM-DD')+' 12:00:00',employeeId:'',customId:'customId_001',orderId:'order_001',isPay:false,serviceList:[{id:1,name:'舞蹈'},{id:1,name:'唱歌'}]},
        // {id:2,name:'客户卡片2',start:moment().format('yyyy-MM-DD')+' 12:00:00',end:moment().format('yyyy-MM-DD')+' 14:00:00',employeeId:'',customId:'customId_002',orderId:'order_002',isPay:false,serviceList:[{id:3,name:'弹吉他'},{id:4,name:'煮菜'}]},
        // {id:3,name:'客户卡片3',start:moment().format('yyyy-MM-DD')+' 14:00:00',end:moment().format('yyyy-MM-DD')+' 16:10:00',employeeId:'',customId:'customId_003',orderId:'order_003',isPay:false,serviceList:[{id:3,name:'弹吉他'},{id:4,name:'煮菜'}]},
      ],
      pageParam:{pageNum: 1,pageSize: 9000},
      tableData:[],
      cellRowEntering:'', // 控制拖拽时同一列下重复触发处理
      cellRowEnterInfo:{},
      drawerTitle:'预约结账',
      cardInfoFormDrawerTitle:'新增卡片',
      cardInfoFormUpdateDrawerTitle:'编辑卡片',
      customOptions:[],
      customOptionFilter:[],
      filterCustomTimer: null, // 防抖定时器
      customForm:{customPhone:null,customNickName:null},
      customFormRules:{
        customPhone: [{ required: true, message: "客户电话不能为空", trigger: "blur" }],
        customNickName:[{ required: true, message: "客户姓名不能为空", trigger: "blur" }],
        },
      payForm:{payAmount:undefined,payType:null,dz:null,sk:null,xj:null,lpk:null,lpkCode:null,errorToolTip:null,successToolTip:null,giftCard:null},
      payFormRules:{serviceGroup:[{required: true, trigger: "blur", message: "支付服务不能为空"}],payAmount:[{required: true, trigger: "blur", message: "请选择支付金额"}],payType:[{required: true, trigger: "blur", message: "请选择支付类型"}]},
      addCardInfoForm:{customId:null,remark:null,lastStart:this.getInitStart(),start:this.getInitStart(),serviceList:[],cardName:null,cardNum:1,point:null,pointName:null,children:[],selectServiceList:[]},
      addCardHistoryInfo:{firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null},
      addCardInfoFormRule:{
        customId:[{required: true, trigger: "change", message: "请选择客户"}],
        start:[{required: true, trigger: "blur", message: "请选择预约开始时间"}],
        cardName:[{required: true, trigger: "blur", message: "请选择预约人数"}],
        cardNum:[{required: true, trigger: "blur", message: "请选择预约人数"}],
        selectServiceList:[{required: true, trigger: "change", message: "请选择预约服务"}]},
      updateCardInfoForm:{employeeId:null,customId:null,remark:null,lastStart:null,start:null,serviceList:[],cardName:null,cardNum:1,point:null,pointName:null,children:[],selectServiceList:[]},
      updateCardHistoryInfo:{firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null},
      updateCardInfoFormRule:{
        customId:[{required: true, trigger: "change", message: "请选择客户"}],
        start:[{required: true, trigger: "blur", message: "请选择预约开始时间"}],
        cardName:[{required: true, trigger: "blur", message: "请选择预约人数"}],
        // cardNum:[{required: true, trigger: "blur", message: "请选择预约人数"}],
        selectServiceList:[{required: true, trigger: "change", message: "请选择预约服务"}]},
      addCardInfoItemForm:{serviceId:undefined,serviceNum:undefined},
      currentRow:{},
      selectDate:moment().format('yyyy-MM-DD'),
      // selectDate:'2024-05-14',

      shortcuts :[
        {
          text: '今天',
          value: new Date(),
        },
        {
          text: '昨天',
          value: () => {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24)
            return date
          },
        },
        {
          text: '一周前',
          value: () => {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
            return date
          },
        },
      ],
      serviceTree:[],
      serviceList:[],
      serviceDict:{},
      setCashBalanceDailogVisiable:false,
      payOutDailogVisiable:false,
      settlementDailogVisiable:false,
      sellGiftCardDailogVisiable:false,
      setCCDailogVisiable:false,
      payOutFormRules: {
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
      },
      payOutForm: {
        id: null,
        payOutTime: null,
        payOutAmount: null,
        payOutType: null,
        reason:null,
        createTime: null,
        createBy: null
      },
      payOutTypeOptions:[
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
      ],
      incomeInfoForm:{
        id: null,
        date: null,
        cc: null,
        balanceBeforeWork: null,
        cashIncome: null,
        giftCardIncome: null,
        createTime: null,
        createBy: null
      },
      incomeInfoFormRules:{
        date: [
          { required: true, message: "收入时间不能为空", trigger: "blur" }
        ],
        balanceBeforeWork:[
          { required: true, message: "请输入余额", trigger: "blur" }
        ]
      },
      setCCForm:{
        date: null,
        cc: null
      },
      setCCFormRules:{
        date: [
          { required: true, message: "收入时间不能为空", trigger: "blur" }
        ],
        cc:[
          { required: true, message: "请输入POS机金额", trigger: "blur" }
        ]
      },
      // 当天收入数据(如上班前余额,手动上传的刷卡金额)
      incomeInfo:{},
      // 会员卡列表
      giftCardInfo:[],
      // 会员卡收入数据
      giftCardPayAmount:{},
      // 预约卡收入数据
      cardPayAmount:{},
      // 支出数据
      payOutAmount:{},
      cardPopoverTrigger:'hover'
    }
  },
  watch:{
    'payOutForm.payOutType':function (value){
      console.log('监听表单',value)
      if(value && value==='其它'){
        if(!this.payOutFormRules.hasOwnProperty('reason')){
          this.payOutFormRules['reason']=[{ required: true, message: "支出原因不能为空", trigger: "blur" }]
        }
      }
    }
    // ,
    // 'payForm.lpkCode':function (value){
    //   if(value){
    //     console.log('监听结账表单的会员卡支付',value)
    //     let giftCardCodeList=value.split(',')
    //
    //     // 未使用会员卡卡片才有效
    //     let giftCardList= this.giftCardInfo.filter(e=>giftCardCodeList.includes(e.giftCardCode) && e.status=='1')
    //     let existGiftCardCodeList= giftCardList.map(e=>e.giftCardCode)
    //
    //     let unExistGiftCardCodeList=_.difference(giftCardCodeList, existGiftCardCodeList)
    //     console.log('判断卡片是否有效',giftCardCodeList,existGiftCardCodeList,unExistGiftCardCodeList)
    //
    //     let successToolTip=''
    //     let errorToolTip=''
    //     if(giftCardList && giftCardList.length>0){
    //       console.log('打印存在的会员卡',giftCardList)
    //       let total=0
    //       giftCardList.forEach((e,index)=>{
    //         successToolTip+=e.giftCardCode+'的抵扣金额为'+e.giftCardDeductionPrice+'元;'
    //         total+=e.giftCardDeductionPrice
    //       })
    //       // 合计
    //       let actualMoney=0
    //       if(total>this.payForm.payAmount){
    //         successToolTip+='共可抵扣'+this.payForm.payAmount+'元 (检测到会员卡可抵扣费用超出支付费用,超出部分将无法返回)'
    //         actualMoney=this.payForm.payAmount
    //       }else{
    //         successToolTip+='共可抵扣'+total+'元'
    //         actualMoney=total
    //       }
    //       this.payForm.giftCard=existGiftCardCodeList.join(',')
    //       this.payForm.lpk=actualMoney
    //       this.payForm.successToolTip=successToolTip
    //     }else{
    //       this.payForm.successToolTip=''
    //       this.payForm.lpk=null
    //       this.payForm.giftCard=''
    //     }
    //     if(unExistGiftCardCodeList && unExistGiftCardCodeList.length>0){
    //       this.payForm.errorToolTip='编码无效或编码已使用:'+unExistGiftCardCodeList.toString()
    //     }else{
    //       this.payForm.errorToolTip=''
    //     }
    //   }else{
    //     this.payForm.errorToolTip=''
    //     this.payForm.successToolTip=''
    //   }
    //
    // }


    ,deep:true},


  computed:{
    currentCashBalance(){
      let currentCashBalance=this.giftCardPayAmount.xj+this.incomeInfo.balanceBeforeWork+this.cardPayAmount.xj-this.payOutAmount.total
      return currentCashBalance?currentCashBalance:0
    }

  },

  beforeUnmount() {
    // 清理防抖定时器，避免内存泄漏
    if (this.filterCustomTimer) {
      clearTimeout(this.filterCustomTimer);
      this.filterCustomTimer = null;
    }
  },
  created() {
    this.getServiceInfo()
    this.refreshShowData()
  },
  mounted() {
    this.getTableData()
    let dom =document.getElementById('table')
    let appMainEle =document.getElementById('app-main')
    let that=this

    // 兼容手机端拖拽功能
    appMainEle.addEventListener('touchend',function (event){
      // alert(111)
      console.log('touchend',event,event.changedTouches[0],event,event.changedTouches[0].clientX,event.changedTouches[0].clientY)
      let targetDom=document.elementFromPoint(event.changedTouches[0].pageX,186)
      console.log('移动到的节点',targetDom,targetDom.getAttributeNames(),targetDom.classList[0].split('column_')[1],that.employeeList,that.employeeList.length>=targetDom.classList[0].split('column_')[1])
      if(targetDom && targetDom.classList.contains('el-table__cell') && event.changedTouches[0].pageY<dom.getBoundingClientRect().height+dom.getBoundingClientRect().top && event.changedTouches[0].pageY>186 &&! event.target.classList.contains('el-table__cell')){
        if(that.employeeList.length>=Number(targetDom.classList[0].split('column_')[1])){
          console.log('移动到的节点--------------',targetDom,event.target,targetDom.getAttributeNames(),targetDom.classList[0].split('column_')[1],that.employeeList,that.employeeList.length>=targetDom.classList[0].split('column_')[1])
          const employeeId=that.employeeList[Number(targetDom.classList[0].split('column_')[1])-1].employeeId
          console.log('移动到该员工',employeeId)
          // 鼠标进入当前列时修改列样式
          let columnDom=document.getElementsByClassName(targetDom.classList[0])
          // console.log('鼠标进入当前列时修改列样式',columnDom,columnDom.length)
          Array.from(columnDom).forEach(item=>{
            // console.log('鼠标进入当前列时修改列样式',item,column.id,item.classList)
            item.classList.add(['column-table-hover'])
          })
          that.cellRowEntering=targetDom.classList[0]
          let cardId = ''
          if(event.target.getAttribute('resource-id')){
            cardId=event.target.getAttribute('resource-id')
          }else if(event.target.firstElementChild && event.target.firstElementChild.getAttribute('resource-id')){
            cardId=event.target.firstElementChild.getAttribute('resource-id')
          }else if(event.target.firstElementChild && event.target.firstElementChild.firstElementChild && event.target.firstElementChild.firstElementChild.getAttribute('resource-id')){
            cardId=event.target.firstElementChild.firstElementChild.getAttribute('resource-id')
          }else if(event.target.parentElement.firstElementChild && event.target.parentElement.firstElementChild.getAttribute('resource-id')){
            cardId=event.target.parentElement.firstElementChild.getAttribute('resource-id')
          }else if(event.target.parentElement.firstElementChild && event.target.parentElement.firstElementChild.firstElementChild && event.target.parentElement.firstElementChild.firstElementChild.getAttribute('resource-id')){
            cardId=event.target.parentElement.firstElementChild.firstElementChild.getAttribute('resource-id')
          }

          that.cardBindEmployee(cardId,employeeId)
        }
      }
    })


    // 主表和预约表容器高度拖拽线（优化版：修复拖拽跳转问题）
    var dragLine = document.getElementById('dragLine')
    dragLine.onmousedown = function (e) {
      that.cardPopoverTrigger='click'
      e.preventDefault()
      e.stopPropagation()
      
      let container_top = document.getElementById('container-top')
      let container_bottom = document.getElementById('container-bottom')
      
      // 记录初始状态：初始鼠标位置和初始容器高度
      const startY = e.clientY
      const startTopHeight = container_top.getBoundingClientRect().height
      const startBottomHeight = container_bottom.getBoundingClientRect().height
      
      // 添加拖拽类，禁用过渡动画
      container_top.classList.add('dragging')
      container_bottom.classList.add('dragging')
      
      console.log('拖拽开始 - 初始高度:', startTopHeight, startBottomHeight, '初始鼠标Y:', startY)
      
      if(!document.onmousemove){
        document.onmousemove = function (event) {
          event.preventDefault()
          event.stopPropagation();
          
          // 计算鼠标移动的距离（向下为正，向上为负）
          const deltaY = event.clientY - startY
          
          // 根据初始高度和移动距离计算新高度
          // 向上拖动（deltaY < 0）：顶部变小，底部变大
          // 向下拖动（deltaY > 0）：顶部变大，底部变小
          let newTopHeight = startTopHeight + deltaY
          let newBottomHeight = startBottomHeight - deltaY
          
          // 限制高度范围：顶部100-700px，底部自动调整
          if(newTopHeight >= 100 && newTopHeight <= 700){
            container_top.style.height = newTopHeight + 'px'
            container_bottom.style.height = newBottomHeight + 'px'
          } else if(newTopHeight < 100) {
            // 如果超出最小值，设置为最小值
            container_top.style.height = '100px'
            container_bottom.style.height = (startTopHeight + startBottomHeight - 100) + 'px'
          } else if(newTopHeight > 700) {
            // 如果超出最大值，设置为最大值
            container_top.style.height = '700px'
            container_bottom.style.height = (startTopHeight + startBottomHeight - 700) + 'px'
          }
        }
      }
      
      document.onmouseup = function(event){
        event.preventDefault()
        event.stopPropagation();
        that.cardPopoverTrigger='hover'
        
        // 移除拖拽类，恢复过渡动画
        container_top.classList.remove('dragging')
        container_bottom.classList.remove('dragging')

        if(document.onmouseup){
          document.onmousemove = null;
          document.onmouseup = null;
        }
      }
    }

  },
  methods: {

    dayHeaderContent(header){
      // 失效
      console.log('打印Header勾子数据',header)
    },

    /** 提交设置CC表单 */
    submitSetCCForm(){
      this.$refs["setCCFormRef"].validate(valid => {
        if (valid) {
          addIncomeInfo(this.setCCForm).then(response => {
            ElMessage({
              type:'success',
              message:'设置CC成功'
            })
            this.resetSetCCForm()
            this.refreshShowData()
            this.setCCDailogVisiable= false;
            // 打开结算弹窗
            this.handerSettlement()
          });
        }
      });
    },
    /** 提交设置上班前余额表单 */
    submitIncomeForm() {
      this.$refs["incomeInfoRef"].validate(valid => {
        if (valid) {
          addIncomeInfo(this.incomeInfoForm).then(async (response) => {
            ElMessage({
              type:'success',
              message:'修改余额成功'
            })

            if(this.incomeInfoForm.date===moment().add(1,'day').format('YYYY-MM-DD')){
              this.selectDate=this.incomeInfoForm.date
              await this.getTableData()
              this.$refs.fullCalendar.getApi().gotoDate(this.selectDate)
            }
            this.resetIncomeInfoForm()
            this.refreshShowData()
            this.setCashBalanceDailogVisiable= false;
            this.settlementDailogVisiable=false
          });
        }
      });
    },
    /** 提交支出表单 */
    submitPayOutForm() {
      this.$refs["payOutInfoRef"].validate(valid => {
        if (valid) {
          addPayOutInfo(this.payOutForm).then(response => {
            ElMessage({
              type:'success',
              message:'新增成功'
            })
            this.resetPayOutForm()
            this.refreshShowData()
            this.payOutDailogVisiable = false;
          });
        }
      });
    },

    // 重置结算表单
    resetPayForm(){
      this.payForm={payAmount:undefined,payType:'电子支付',dz:null,sk:null,xj:null,lpk:null,lpkCode:null,errorToolTip:null,successToolTip:null,giftCard:null}
    },
    // 重置支出表单
    resetPayOutForm() {
      this.payOutForm = {
        id: null,
        payOutTime: this.selectDate,
        payOutAmount: null,
        payOutType: null,
        reason:null,
        createTime: null,
        createBy: null
      }
    },

    // 重置收入表单
    resetIncomeInfoForm(fromSettlement) {
     if(fromSettlement){
       // 来自收工弹窗时间需要加一天
       this.incomeInfoForm = {
         date: moment(this.selectDate).add(1,'day').format('YYYY-MM-DD'),
         balanceBeforeWork: null,
       }
       listIncomeInfo({date:moment(this.selectDate).add(1,'day').format('YYYY-MM-DD')}).then(res=>{
         if(res.rows && res.rows.length>0){
           this.incomeInfoForm.balanceBeforeWork=res.rows[0].balanceBeforeWork
         }
       })

     }else{
       this.incomeInfoForm = {
         date: this.selectDate,
         balanceBeforeWork: this.incomeInfo.balanceBeforeWork?this.incomeInfo.balanceBeforeWork:null,
       }
     }

    },

   // 重置设置CC表单
   resetSetCCForm(){
     this.setCCForm = {
       date: this.selectDate,
       cc: this.incomeInfo.cc?this.incomeInfo.cc:null,
     }
   },
    // 增加卡片弹窗设置时间控件默认值
    getInitStart(){
      return moment(this.selectDate).get('hour')<9 || moment(this.selectDate).get('hour')>22?moment(this.selectDate).format("YYYY-MM-DD")+' 09:00:00':moment(this.selectDate).format("YYYY-MM-DD HH:mm:ss")
    },
    // 打开设置余额弹窗
    setCashBalance(){
      if(!this.isToday()){
        ElMessage.warning('仅允许当天进行设置')
        return
      }
      this.resetIncomeInfoForm()
      this.setCashBalanceDailogVisiable=true
    },

    // 打开结算弹窗
    handerSettlement(){
      if(!this.isToday()){
        ElMessage.warning('仅允许当天进行设置')
        return
      }
      this.settlementDailogVisiable=true
    },

    // 收工
    workerEnd(){
      this.resetIncomeInfoForm(true)
      this.setCashBalanceDailogVisiable=true
    },

    // 打开设置CC弹窗
    handerSetCC(){
      if(!this.isToday()){
        ElMessage.warning('仅允许当天进行设置')
        return
      }
     this.resetSetCCForm()
      this.setCCDailogVisiable=true
    },
    // 打开支出弹窗
    handerPayOut(){
      if(!this.isToday()){
        ElMessage.warning('仅允许当天进行设置')
        return
      }
      this.resetPayOutForm()
      this.payOutDailogVisiable=true
    },

    // 打开会员卡出售窗口
    sellGiftCard(){
      if(!this.isToday()){
        ElMessage.warning('仅允许当天进行设置')
        return
      }
      this.sellGiftCardDailogVisiable=true
    },
    filterNodeMethod(value, data){return data.label.includes(value)} ,
    //没有子节点的选线才可以选中
    filterDisable(data, node){
      console.log('树结构点击事件',data, node,this.addCardInfoForm.selectServiceList)
      if(data.hasOwnProperty('children') && data.children.length>0){
        return true
      }else{
        return false
      }
    },

    handleCardNumChange (cardNum) {
      console.log('打印预约人数',cardNum)
    },
    getImageRealPath(path){
      return imageRealPath(path)
    },
    /**
     * 下拉选择日期并跳转至相应日期
     */
    async handleDatePick (date) {
      console.log('选择日期',date,this.selectDate)
      // 同步增加卡片的picker时间
      this.addCardInfoForm.start=this.getInitStart()
      // 选择了别的月份，则显示返回今日按钮
      if(date){
        await this.getTableData()
        this.$refs.fullCalendar.getApi().gotoDate(date)
        await this.getServiceInfo()
        await this.refreshShowData()
      }

    },


    // 限制预约时间,预约时间需要大于当前时间
    disabledCardStart(date){
      console.log(moment(date.getTime()).format('YYYY-MM-DD'),this.selectDate)
      // console.log('限制预约时间,预约时间需要大于当前时间',date)
      if(moment(date.getTime()).format('YYYY-MM-DD')===this.selectDate){
        return false
      }else{
        return true
      }
    },

    /**
     * 下拉选择预约时间
     */
    async handleCradStartDatePick (dateTime) {
      console.log('选择日期',dateTime,this.addCardInfoForm.start,this.addCardInfoForm.lastStart)
      // this.addCardInfoForm.lastStart=dateTime
      if(moment(dateTime).get('hour')<9 || moment(dateTime).get('hour')>22){
        console.log('该时间段不在营业时间',moment(dateTime).get('hour'))
        ElMessage({
          type:'warning',
          message:'该时间段不在营业时间,请选择合适的预约时间'
        })
        console.log('打印上一个选择的时间',this.addCardInfoForm.lastStart)
        this.addCardInfoForm.start=this.addCardInfoForm.lastStart
      }else{
        this.addCardInfoForm.lastStart=dateTime
      }
    },
    /**
     * 下拉选择预约时间
     */
    async handleCradStartDatePickInUpdate (dateTime) {
      console.log('选择日期',dateTime,this.updateCardInfoForm.start,this.updateCardInfoForm.lastStart)
      // this.addCardInfoForm.lastStart=dateTime
      if(moment(dateTime).get('hour')<9 || moment(dateTime).get('hour')>22){
        console.log('该时间段不在营业时间',moment(dateTime).get('hour'))
        ElMessage({
          type:'warning',
          message:'该时间段不在营业时间,请选择合适的预约时间'
        })
        console.log('打印上一个选择的时间',this.updateCardInfoForm.lastStart)
        this.updateCardInfoForm.start=this.updateCardInfoForm.lastStart
      }else{
        this.updateCardInfoForm.lastStart=dateTime
      }
    },
    // todo 获取员工列表
    async getEmployeeList(){
      await listEmployeeInfo({...this.pageParam,activeOrNot: '1'}).then(res=>{
        console.log('打印预约员工列表',res.rows)
        this.employeeList=res.rows
      })
    },

    // 新增卡片时客户选择变化
    async handleAddCardCustomIdChange(customId){
      if(customId){
        await this.loadCustomerHistory(customId, 'add')
      } else {
        this.addCardHistoryInfo = {firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null}
      }
    },

    // 编辑卡片时客户选择变化
    async handleUpdateCardCustomIdChange(customId){
      if(customId){
        await this.loadCustomerHistory(customId, 'update')
      } else {
        this.updateCardHistoryInfo = {firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null}
      }
    },

    // 加载客户历史信息
    async loadCustomerHistory(customId, type){
      try {
        const res = await getCustomerHistory(customId)
        if(res && res.data){
          const historyInfo = {
            firstServiceDate: res.data.firstServiceDate || null,
            latestServiceDate: res.data.latestServiceDate || null,
            latestServiceName: res.data.latestServiceName || null,
            latestEmployeeName: res.data.latestEmployeeName || null
          }
          if(type === 'add'){
            this.addCardHistoryInfo = historyInfo
          } else {
            this.updateCardHistoryInfo = historyInfo
          }
        }
      } catch (error) {
        console.error('加载客户历史信息失败:', error)
        if(type === 'add'){
          this.addCardHistoryInfo = {firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null}
        } else {
          this.updateCardHistoryInfo = {firstServiceDate:null,latestServiceDate:null,latestServiceName:null,latestEmployeeName:null}
        }
      }
    },

    // todo 获取服务相关数据
    async getServiceInfo(){
     await this.getServiceTree()
     await this.getServiceList()
     await this.getCustomList()
    },

    async refreshShowData(date){
      await this.getGiftCardInfoList()
      await this.getGiftCardPayAmount(date)
      await this.getCardPayAmount(date)
      await this.getPayOutAmount(date)
      await this.getIncomeInfo(date)
    },

    // 新增客户
    submitAddCustomForm(){
      this.$refs["costomInfoRef"].validate(valid => {
        if (valid) {
          addCostomInfo(this.customForm).then(async (response) => {
            await this.getCustomList();
            this.addCardInfoForm.customId=response.data.customId
            ElMessage.success("新增客户成功")
          });
        }
      });
    },
    // 记录搜索客户关键词,用于填充新增客户表单（优化版：防抖 + 高效搜索）
    filterCustom(value){
      // 清除之前的防抖定时器
      if (this.filterCustomTimer) {
        clearTimeout(this.filterCustomTimer);
      }
      
      // 如果没有输入值，显示所有客户（限制数量）
      if (!value || value.trim() === '') {
        this.customOptions = this.customOptionFilter.slice(0, 100); // 限制显示前100条
        this.customForm = {customPhone: value || '', customNickName: value || ''};
        return;
      }
      
      // 更新表单（用于新增客户）
      this.customForm = {customPhone: value, customNickName: value};
      
      // 防抖：延迟300ms执行搜索，避免频繁触发
      this.filterCustomTimer = setTimeout(() => {
        const searchValue = value.toLowerCase().trim();
        
        // 优化：使用更高效的字符串匹配，避免正则表达式
        // 限制搜索结果最多显示100条，提升性能
        const results = [];
        const maxResults = 100;
        
        for (let i = 0; i < this.customOptionFilter.length && results.length < maxResults; i++) {
          const item = this.customOptionFilter[i];
          const name = (item.customNickName || '').toLowerCase();
          const phone = (item.customPhone || '').toLowerCase();
          
          // 使用 indexOf 代替正则表达式，性能更好
          if (name.indexOf(searchValue) !== -1 || phone.indexOf(searchValue) !== -1) {
            results.push(item);
          }
        }
        
        this.customOptions = results;
      }, 300); // 300ms 防抖延迟
    },

    // 获取会员卡列表（优化：初始只显示前100条）
    async getCustomList(){
      await listCostomInfo(this.pageParam).then(res=>{
        this.customOptionFilter = res.rows; // 保存完整列表用于搜索
        // 初始只显示前100条，提升初始加载性能和渲染速度
        this.customOptions = res.rows.slice(0, 100);
      })
    },

    // 获取会员卡列表
    async getGiftCardInfoList(){
      await listGiftCardSellRecord(this.pageParam).then(res=>{
        this.giftCardInfo=res.rows
      })
    },

    // 获取会员卡收入数据
    getGiftCardPayAmount(date){
      let param={}
      param['payTime']=this.selectDate
      giftCardPayAmount(param).then(res=>{
        this.giftCardPayAmount=res.data
        console.log('会员卡收入数据',res.data)
      })
    },

    // 获取预约卡收入
    async getCardPayAmount(date){
      let param={}
      param['payTime']=this.selectDate
      await cardPayAmount(param).then(res=>{
        this.cardPayAmount=res.data
        console.log('获取预约卡收入',this.cardPayAmount)
      })
    },


    // 获取支出数据
    async getPayOutAmount(date){
      let param={}
      param['payOutTime']=this.selectDate
      await payOutAmount(param).then(res=>{
        this.payOutAmount=res.data
        console.log('获取支出数据',res.data)
      })
    },

    // 获取当天收入数据
    async getIncomeInfo(date){
      let param={}
      param['date']=this.selectDate
      await listIncomeInfo(param).then(res=>{
        if(res.rows && res.rows.length>0){
          this.incomeInfo=res.rows[0]
          this.incomeInfoForm.balanceBeforeWork=res.rows[0].balanceBeforeWork
        }
      })
    },

    // todo 获取服务树
    async getServiceTree(){
      await serviceTreeSelect().then(res=>{
        this.serviceTree=res.data
        console.log('获取服务树',res)
      })
    },

    // todo 获取服务列表
    async getServiceList(){
      await listServiceInfo(this.pageParam).then(res=>{
        console.log('打印服务列表',res.data)
        let serviceDict={}
        res.data.forEach(e=>{
          serviceDict[e.id]=e
        })
        this.serviceList=res.data
        this.serviceDict=serviceDict
      })
    },
    // 打开结账弹窗
    toPay(row,column){
      this.currentRow={row,column}
      let payForm={payAmount:row[column.property].payAmount,payType:'电子支付',cardId:row[column.property].cardId}
      this.payForm=payForm
      console.log('this.$refs.formDrawerRef',this.$refs.formDrawerRef)
      this.$refs.formDrawerRef.openDrawer()
    },
    // 结账提交
    handleSubmit(){
      // 修改支付状态
      const cardInfo=this.currentRow.row[this.currentRow.column.property]
      console.log('打印结账参数',this.payForm,this.currentRow,cardInfo,!!Number(this.payForm.sk))


      if(Number(this.payForm.xj?this.payForm.xj:0)+Number(this.payForm.sk?this.payForm.sk:0)+Number(this.payForm.dz?this.payForm.dz:0)+Number(this.payForm.lpk?this.payForm.lpk:0) !==Number(this.payForm.payAmount)){
        ElMessage.warning("支付金额与订单费用不一致")
        return
      }
      let payParams=[]
      if(Number(this.payForm.xj)){
        payParams.push({ cardId: cardInfo.cardId, payType:'现金支付',payAmount: this.payForm.xj,payTime:moment().format('YYYY-MM-DD HH:mm:ss')})
      }
      if(Number(this.payForm.sk)){
        payParams.push({ cardId: cardInfo.cardId, payType:'刷卡支付',payAmount: this.payForm.sk,payTime:moment().format('YYYY-MM-DD HH:mm:ss')})
      }

      if(Number(this.payForm.dz)){
        payParams.push({ cardId: cardInfo.cardId, payType:'电子支付',payAmount: this.payForm.dz,payTime:moment().format('YYYY-MM-DD HH:mm:ss')})
      }

      if(Number(this.payForm.lpk)){
        payParams.push({ cardId: cardInfo.cardId, payType:'会员卡支付',payAmount: this.payForm.lpk,payTime:moment().format('YYYY-MM-DD HH:mm:ss'),giftCard:this.payForm.giftCard})
      }

      this.payForm.cardOrder=payParams
      console.log('打印支付表单',this.payForm)



      // this.tableDataFromEnd[this.currentRow.column.property].find(e=>cardInfo.id==e.id+'').isPay=true
      // this.cardInfoFromEnd.find(e=>cardInfo.id==e.id+'').isPay=true
      // console.log('打印预约卡片数据',this.cardInfoFromEnd.find(e=>cardInfo.id==e.id+''))
      updateCardOrder({...this.payForm,orderStatus:'2',payTime:moment().format('YYYY-MM-DD HH:mm:ss')}).then(res=>{
        this.getTableData()
        this.$refs.formDrawerRef.closeDrawer()
        // 重置表单
        this.resetPayForm()
        this.refreshShowData()
        ElMessage({
          type: 'success',
          message: '结账成功',
        })
      })

    },
    // 打开添加卡片弹窗
    handleAddEvent(){
      this.$refs.cardInfoFormDrawerRef.openDrawer()
    },
    // 打开添加卡片弹窗
    async handleUpdateEvent(cardId){
      // 赋值
      const cardInfo=this.cardInfoFromEnd.find(item=>item.cardId===cardId)

      if(!cardId || !cardInfo){
        ElMessage.warning("卡片不存在")
        return
      }

      if(cardInfo.orderStatus=='2'){
        ElMessage.warning("卡片已经付款,禁止修改")
        return
      }
      console.log('编辑赋值',cardId,cardInfo)
      let selectServiceList=[]
      cardInfo.serviceList.forEach(e=>{
        selectServiceList.push(e.id)
      })
      let updateCardInfoForm={employeeId:cardInfo.employeeId,cardId:Number(cardId),customId:cardInfo.customId,remark:cardInfo.remark,lastStart:cardInfo.start,start:cardInfo.start,serviceList:cardInfo.serviceList,cardName:cardInfo.cardName,cardNum:1,point:null,pointName:null,children:[],selectServiceList:selectServiceList}
      // 加载客户历史信息
      if(cardInfo.customId){
        await this.loadCustomerHistory(cardInfo.customId, 'update')
      }


      this.updateCardInfoForm=updateCardInfoForm
      console.log('打印赋值后表单',updateCardInfoForm)

      this.$refs.cardInfoUpdateFormDrawerRef.openDrawer()
    },

    // 新增卡片
    handleAddCradFormSubmit(){
      // this.$refs.formDrawerRef.closeDrawer()
      this.$refs.addCradInfoFormRel.validate(valid => {

          if (valid) {
               let addCardInfoList=[]
               let start=moment(this.addCardInfoForm.start).toDate().getTime()
               let end =start
               let amount=0
               let serviceGroup=''
               let serviceWages=0
               let serviceList=[]
               this.addCardInfoForm.selectServiceList.forEach((e,index)=>{
                 console.log('处理当前服务',this.serviceDict[e])
                 let serviceInfo=this.serviceDict[e]
                 end+=serviceInfo.serviceTime*60*1000
                 amount+=serviceInfo.servicePrice
                 serviceWages+=serviceInfo.serviceWages
                 if(index==this.addCardInfoForm.selectServiceList.length-1){
                   serviceGroup+=serviceInfo.serviceName
                 }else{
                   serviceGroup+=serviceInfo.serviceName+'-'
                 }
                 serviceList.push(this.serviceDict[e])

               })
               this.addCardInfoForm.serviceList=serviceList


              console.log(start,end)
              end=moment(end).format('YYYY-MM-DD HH:mm:ss')
              console.log('新增卡片统计工资',this.addCardInfoForm.cardNum,typeof this.addCardInfoForm.cardNum,this.addCardInfoForm.start,end,amount,serviceWages)

              for(let i=0;i<this.addCardInfoForm.cardNum;i++){
                addCardInfoList.push({...this.addCardInfoForm,end:end,serviceWages:serviceWages,payAmount:amount,serviceGroup:serviceGroup,serviceList:JSON.stringify(this.addCardInfoForm.serviceList)})
              }
              console.log('打印新增卡片的最终参数',addCardInfoList)

              // 发送短信
              const smsData = {
                  toPhoneNumber: `whatsapp:+1${this.addCardInfoForm.customPhone}`,
                  messageBody: `Your appointment is coming up on ${this.addCardInfoForm.start}. `,
              };

              twilioService.sendSms(smsData.toPhoneNumber, smsData.messageBody)
                  .then(() => {
                      console.log('SMS sent successfully!');
                      this.$message.success('Appointment created and SMS sent!');
                      // ... other success logic
                  })
                  .catch(error => {
                      console.error('Error sending SMS:', error);
                      this.$message.error('Failed to send SMS, please try again later!');
                  });

              batchSaveServiceInfo(addCardInfoList).then(res=>{
                if(res.code==200){
                  this.getTableData()
                  this.$refs.cardInfoFormDrawerRef.closeDrawer()
                  this.resetForm("addCradInfoFormRel")
                  ElMessage({
                    message: '增加卡片成功',
                    type: 'success',
                  });


                }else{
                  ElMessage({
                    message: '增加卡片异常',
                    type: 'fail',
                  })
                }
              })
            }
        })
    },

    handleUpdateCradFormSubmit(){

      this.$refs.updateCradInfoFormRel.validate(valid => {
        if (valid) {
          let start=moment(this.updateCardInfoForm.start).toDate().getTime()
          let end =start
          let amount=0
          let serviceGroup=''
          let serviceWages=0
          let serviceList=[]
          this.updateCardInfoForm.selectServiceList.forEach((e,index)=>{
            console.log('处理当前服务',this.serviceDict[e])
            let serviceInfo=this.serviceDict[e]
            end+=serviceInfo.serviceTime*60*1000
            amount+=serviceInfo.servicePrice
            serviceWages+=serviceInfo.serviceWages
            if(index==this.updateCardInfoForm.selectServiceList.length-1){
              serviceGroup+=serviceInfo.serviceName
            }else{
              serviceGroup+=serviceInfo.serviceName+'-'
            }
            serviceList.push(this.serviceDict[e])
          })
          this.updateCardInfoForm.serviceList=serviceList
          console.log(start,end)
          end=moment(end).format('YYYY-MM-DD HH:mm:ss')
          console.log('编辑卡片统计工资',this.updateCardInfoForm.cardNum,typeof this.updateCardInfoForm.cardNum,this.updateCardInfoForm.start,end,amount,serviceWages)

          const updateCardInfoList={...this.updateCardInfoForm,end:end,serviceWages:serviceWages,payAmount:amount,serviceGroup:serviceGroup,serviceList:JSON.stringify(this.updateCardInfoForm.serviceList)}
          console.log('打印编辑卡片的最终参数',updateCardInfoList)
          updateCardInfo(updateCardInfoList).then(res=>{
            if(res.code==200){
              this.getTableData()
              this.$refs.cardInfoUpdateFormDrawerRef.closeDrawer()
              // this.resetForm("addCradInfoFormRel")
              ElMessage({
                message: '修改卡片成功',
                type: 'success',
              })
            }else{
              ElMessage({
                message: '修改卡片异常',
                type: 'fail',
              })
            }
          })
        }
      })
    },


    handleCradFormDelete(){
      if(this.updateCardInfoForm.cardId){
        ElMessageBox.confirm(
            '是否要删除此卡片',
            'Warning',
            {
              confirmButtonText: 'OK',
              cancelButtonText: 'Cancel',
              type: 'warning',
            }
        )
            .then(() => {
              delCardInfo(this.updateCardInfoForm.cardId).then(res=>{
                if(res.code==200){
                  this.getTableData()
                  this.$refs.cardInfoUpdateFormDrawerRef.closeDrawer()
                  // this.resetForm("addCradInfoFormRel")
                  ElMessage({
                    message: '删除卡片成功',
                    type: 'success',
                  })
                }else{
                  ElMessage({
                    message: '删除卡片异常',
                    type: 'fail',
                  })
                }
              })

            })
            .catch(() => {
              ElMessage({
                message: '删除卡片异常',
                type: 'fail',
              })
            })




      }else{
        ElMessage({
          message: '卡片不存在',
          type: 'fail',
        })
      }
    },





    // 加载主表数据,将长度填充至30条
    async getTableData(){
      await this.getEmployeeList()
      // todo 获取主表数据

      await this.getCardInfoList()

      const groupEmployeeId = _.groupBy(this.cardInfoFromEnd.filter(e=>e.employeeId), 'employeeId')
      console.log('groupEmployeeId',groupEmployeeId)
      
      // 优化：对每个技师下的卡片按绑定时间（updateTime）排序，越早绑定的越靠上
      for (let employeeId in groupEmployeeId) {
        if (groupEmployeeId.hasOwnProperty(employeeId)) {
          groupEmployeeId[employeeId].sort((a, b) => {
            // 使用 updateTime 作为绑定时间排序依据
            // 如果 updateTime 不存在，使用 createTime 作为备选
            const timeA = a.updateTime ? new Date(a.updateTime).getTime() : (a.createTime ? new Date(a.createTime).getTime() : 0)
            const timeB = b.updateTime ? new Date(b.updateTime).getTime() : (b.createTime ? new Date(b.createTime).getTime() : 0)
            // 升序排序：越早绑定的（时间越小）越靠上
            return timeA - timeB
          })
        }
      }
      
      this.tableDataFromEnd=groupEmployeeId
      const tableData=this.tableDataFromEnd

      // todo 2.封装获table数据
      this.handelerTableData(tableData)
      // todo 2.封装获卡片数据
      this.handelCradInfo(this.cardInfoFromEnd)
    },

    // 获取卡片列表
    async getCardInfoList(){
      let param={
        ...this.pageParam,
        start:this.selectDate
      }
      await listCardInfo(param).then(res=>{
        console.log('打印卡片列表',param,res.rows)
        res.rows.forEach(e=>{
          // 将serviceList转换为JSON
          if(e.serviceList){e.serviceList=JSON.parse(e.serviceList)}else{e.serviceList=[]}
        })
        this.cardInfoFromEnd=res.rows
      })
    },

    // todo 封装主表数据
    handelerTableData(tableData){
      // TODO 将员工卡片数据封装
      let maxLength=0
      let table_header={}
      this.employeeList.forEach((employee,index)=>{
        table_header[employee.employeeId]=[]
        if(tableData && tableData.hasOwnProperty(employee.employeeId)){
          table_header[employee.employeeId]=tableData[employee.employeeId]

          if(tableData[employee.employeeId].length>maxLength){
            maxLength=tableData[employee.employeeId].length
          }
        }
      })
      console.log('第一步封装table_header',table_header)
      let table_body=[]
      for(let i=0;i<maxLength;i++){
        let table_body_item={}
        for(let key in table_header){
          if(table_header[key].length>=(i+1)){
            table_body_item[key]=table_header[key][i]
          }else{
            table_body_item[key]=null
          }
        }
        table_body.push(table_body_item)
      }

      // todo 填充数据
      if(table_body.length<=this.defalutTableDataSize){
        this.fillTableData(this.defalutTableDataSize-table_body.length,table_body)
      }

      console.log('第二步封装table_body',table_body)
      this.tableData=table_body
    },

    // todo 封装卡片数据
    handelCradInfo(cardInfo){
      // 绑定客户的客片不需要在预约表里展示
      // cardInfo=cardInfo.filter(e=>!e.employeeId)


      // console.log('绑定客户的客片不需要在预约表里展示',cardInfo)
      // 根据预约时长权重优先展示
      cardInfo.sort((from,to)=> {
        // console.log('斤斤计较经济界',new Date(to.start).getTime(),moment(to.start).toDate().getTime(),moment(to.end).toDate().getTime(),(moment(to.end).toDate().getTime()-moment(to.start).toDate().getTime()),(moment(from.end).toDate().getTime()-moment(from.start).toDate().getTime()))
        return (moment(to.end).toDate().getTime()-moment(to.start).toDate().getTime())-(moment(from.end).toDate().getTime()-moment(from.start).toDate().getTime())

      })

      console.log('根据预约时长权重优先展示',cardInfo)
      let countMap={}
      for(let i=0;i<24;i++){
        countMap[i+'']=0
      }

      // 插件里边会根据ID进行排序 所以需要重新定义ID
      cardInfo.forEach((e,index)=>{
        // 统计每个时间端的预约个数
        for(let key in countMap){
          let end=e.end
          if(e.end.endsWith("00:00")){
            end=moment(e.end).subtract(1,'second').format('YYYY-MM-DD HH:mm:ss')
          }
          if(moment(e.start).get('hour')<=Number(key) && moment(end).get('hour')>=Number(key) && e.orderStatus==='1'){
            countMap[key]+=1
          }
        }

        // todo 十分重要:首节点需把parentId键删掉,不然进度条出不来
        // if(e.hasOwnProperty('parentId') && !e['parentId']){
        //   delete e['parentId']
        // }
        // todo 根据支付状态确定卡片颜色
        // if(e.orderStatus!=='1'){
        //   e['eventColor']='#9ad6d0'
        // }else{
        //   e['eventColor']='#f8efef'
        // }
        e['eventColor']='#f3dcdc'
        // cardId封装到extendsProps里,拖拽时需要这个ID进行绑定（重要）
        e['cardId']=e['cardId']+''
        e['id']=index+''
        // todo 十分重要: 甘特图需要用recorceId和Tile加载
        e['resourceId']=e['id']
        e['title']=e['cardName']
        e['durationEditable']=false

      })


      console.log('countMap',countMap)
      const resources=_.cloneDeep(cardInfo)
      const events=_.cloneDeep(cardInfo)

      const pools=[]
      cardInfo.forEach((card,index)=>{
        console.log('打印createTime用于排查问题'+index,card.createTime,card.start)
        if(index==0){
          // 初始化第一个池
          pools.push([card])
        }else{
          // 如果存在重复值则向下追加pool
          outerLoop: for(let i=0;i<pools.length;i++){
            const isDumpMoreParams=[...pools[i],card]
            // console.log('判断是否存在重复值',isDumpMoreParams,this.isDumpMore(isDumpMoreParams))
            if(!this.isDumpMore(isDumpMoreParams)){
              pools[i].push(card)
              // console.log('判断是否存在重复值',card.id,i+'')
              if(card.id!=i+''){
                // console.log('判断是否存在重复值1111',index,resources,cardInfo)
                // 删除资源，同时将event指向相应的pool
                let resources_index=resources.findIndex(resource=>resource.id===card.id)

                resources.splice(resources_index,1)
                // console.log('判断是否存在重复值222',card.id,i+'',resources,cardInfo,index)
                // events[index].resourceId=i+''
                if(i==0){
                  events[index].resourceId='0'
                }else{
                  events[index].resourceId=this.generatResourceId(i)
                }

              }
              break outerLoop
            }
            // 添加一个新的池
            if(i===pools.length-1){
              let resource=resources.find(resource=>resource.id===card.id)
              let event_index=events.findIndex(event=>event.id===card.id)
              // resource.id=pools.length+''
              // events[event_index].resourceId=pools.length+''
              resource.id=this.generatResourceId(pools.length)
              events[event_index].resourceId=this.generatResourceId(pools.length)
              pools.push([card])

              // console.log('判断是否存在重复值222',card.id,resources,cardInfo,index)
              // console.log('打印池',pools,resources,cardInfo)
              break outerLoop
            }
          }

        }
      })



      // console.log('打印第三个池11',pools[2])

      this.calendarOptions.resources=resources
      this.calendarOptions.events=events

      // 追加三条空的resource 用于触发点击添加卡片
      this.appendResource(20)

      console.log('封装卡片数据',resources,events)
      // 重新渲染fullCalendar事件
      // this.$refs.fullCalendar.getApi().addResource(this.calendarOptions.resources)
      this.$nextTick(()=>{
        let calendarApi =this.$refs.fullCalendar.getApi()

        // 该方式会触发滚动条回滚,所以弃用
        // let events=calendarApi.getEvents();
        //
        // if(events.length>0){
        //
        //   events.forEach(event=>{
        //
        //     event.remove()
        //
        //   })
        //
        // }
        // cardInfo.forEach(event=>{
        //   // 调用fullcalendar API进行事件添加
        //   calendarApi.addEvent(event)
        //   calendarApi.addResource(event)
        // })
        // todo 防止滚动条回滚
        calendarApi.refetchResources()
        calendarApi.refetchEvents()



        // dayHeaderContent失效,所以在这里统计每个时间段的预约个数并填充到表头
        let header=document.getElementsByClassName("fc-timeline-slot-cushion")
        console.log('打印header节点',header)
        if(header){
          Array.from(header).forEach(e=>{
            // e.innerHTML=e.innerHTML+'(哈哈)'
            let createEl=document.createElement('span')
            let key=''

            if(e.innerText.indexOf('pm')>-1){

              let keyNum=e.innerText.substring(0,e.innerText.indexOf('pm'))
              if(keyNum==='12'){
                key=Number(keyNum)+''
              }else{
                key=Number(keyNum)+12+''
              }

            } else{
              key=e.innerText.substring(0,e.innerText.indexOf('am'))
            }
            console.log(e.innerText,key)
            if(countMap[key]){
              createEl.innerText="("+countMap[key]+")"
            }
            if(countMap[key]>=this.employeeList.length){
              createEl.style.color="red"
            }else{
              createEl.style.color="green"
            }

            createEl.style.fontSize='12px'
            if(e.firstElementChild){
              console.log('e.firstElementChild',e.firstElementChild)
              e.removeChild(e.firstElementChild)
              }

            e.appendChild(createEl)

          })
          this.$forceUpdate()
        }

        let hour=moment().get('hour')
        // hour=11
        if(hour>=9 && hour<=23){
          // console.log('打印fc-scrollgrid-liquid的getBoundingClientRect',document.querySelector('.fc-scroller-harness').getBoundingClientRect())
          document.getElementById("fullCalendar").scrollLeft=document.querySelector('.fc .fc-scrollgrid-liquid').getBoundingClientRect().width/11*(hour-8)
        }else{
          document.getElementById("fullCalendar").scrollLeft=0
        }

        // if(hour>=12){
        //   document.getElementById("fullCalendar").scrollLeft=document.querySelector('.fc .fc-scrollgrid-liquid').getBoundingClientRect().width
        // }else{
        //   document.getElementById("fullCalendar").scrollLeft=0
        // }


        console.log(document.getElementById("fullCalendar").scrollLeft,1111111111,document.querySelector('.fc .fc-scrollgrid-liquid').getBoundingClientRect().width,document.getElementById("fullCalendar").getBoundingClientRect().width)

            // .fc .fc-scrollgrid-liquid
        // if("Google Chrome"===this.detectBrowser()){
        //   // 谷歌浏览器做兼容
        //   document.getElementById("fullCalendar").style.width=document.getElementById("fullCalendar").getBoundingClientRect().width*2+'px'
        //   let scrollgrid=document.querySelector(".fc .fc-scrollgrid-liquid")
        //   // scrollgrid.parentElement.style=document.getElementById("fullCalendar").getBoundingClientRect().width*2+'px'
        //
        //   if(scrollgrid){
        //     scrollgrid.style.width=document.getElementById("fullCalendar").getBoundingClientRect().width*4+'px'
        //   }
        //   console.log('谷歌浏览器做兼容',document.querySelector(".fc .fc-scrollgrid-liquid"))
        // }
      })

    },
    generatResourceId(length){
      let id=""
      for(let i=0;i<length;i++){
        id+='1'
      }
      return id
    },
  detectBrowser() {
  const userAgent = navigator.userAgent;
  if (userAgent.indexOf("Chrome")!== -1 && userAgent.indexOf("Safari") !== -1 && userAgent.indexOf("Edg") === -1) {
    return "Google Chrome"; // Chrome
  } else if (userAgent.indexOf("Firefox") !== -1) {
    return "Mozilla Firefox"; // Firefox
  } else if (userAgent.indexOf("Safari") !== -1 && userAgent.indexOf("Chrome") === -1 && userAgent.indexOf("Edge") === -1) {
    return "Apple Safari"; // Safari
  } else if (userAgent.indexOf("Edg") !== -1) {
    return "Microsoft Edge"; // Edge
  } else {
    return "Unknown browser"; // 其他浏览器...（可根据自己需要确定是否新增其他浏览器的判断）
  }
},


// todo 判断多个数组是否存在重复值
    isDumpSingle(periods){
      // console.log('打印重叠参数',periods)
      const startTimes=periods.map(period=>moment(period.start))
      const endTimes=periods.map(period=>moment(period.end))
      const maxStartTime=moment.max(startTimes)
      const minEndTime=moment.min(endTimes)
      // console.log(maxStartTime,minEndTime)
      if(maxStartTime.isBefore(minEndTime)){
        return {start:maxStartTime.format('yyyy-MM-DD HH:mm:ss'),end:minEndTime.format('yyyy-MM-DD HH:mm:ss')}
      }else{
        return null
      }
    },
    isDumpMore(periods){
      let dumpList=[]
      for(let i=0;i<periods.length;i++){
        for(let j=i+1;j<periods.length;j++){
          if(!(periods[i].start===periods[j].start && periods[i].end===periods[j].end)){
            let dump=this.isDumpSingle([periods[i],periods[j]])
            if(dump){
              dumpList.push(dump)
            }
          }else{
            if(i!==j){
              dumpList.push(periods[i])
            }
          }
        }
      }
      if(dumpList?.length>0){
        // 去除重复的重叠数据
        let result=[]
        let obj={}
        dumpList.map(item=>{
          let key=item.start+item.end
          obj[key]=item
        })
        for(let key in obj){
          result.push(obj[key])
        }
        // console.log('打印重叠的时间段',result)
        return true
      }else{
        return false
      }
    },
    // 追加三条空的resource 用于触发点击添加卡片
    appendResource(resourceCount){
      // 移动端点击事件不作处理,所以不用追加记录方便点击
      if(!isMobile()){
        for(let i=0;i<resourceCount;i++){
          this.calendarOptions.resources.push({id:'resources_'+i,eventColor:'transparent'})
          this.calendarOptions.events.push({resourceId:'resources_'+i,resourceMark:'fill_resources',start:this.selectDate+' 09:01:00',end:this.selectDate+' 09:02:00'})
        }
      }
    },



    fillTableData(count,table_body){
      for(let i=0;i<count;i++){
        let item={}
        this.employeeList.forEach(employ=>{
          item[employ.id]=null
        })
        table_body.push(item)
      }
    },

    cardBindEmployee(cardId,employeeId){
      employeeId=employeeId+''
      // 根据卡片Id处理绑定数据
      try {
        // todo 获取卡片信息

        const cardInfo=this.cardInfoFromEnd.find(item=>item.cardId===cardId)

        // todo  PC端通过moveenter获取到employeeId,移动端则是通过touchend兼容后可以直接获取到主表的列id
        // let employeeId=this.cellRowEnterInfo.column.property
        // if(employeeIdFromMobile){
        //   // 如果是移动端,通过touchend兼容后可以直接获取到主表的列id
        //   employeeId=employeeIdFromMobile
        // }

        const employeeInfo=this.employeeList.find(item=>item.employeeId+''===employeeId)
        // console.log(this.cardInfoFromEnd,cardId,cardInfo)
        const oldEmployeeInfo=this.employeeList.find(item=>item.employeeId+''===cardInfo.employeeId+'')
        // console.log('打印正在操作的Cell',this.calendarOptions.resources,this.cellRowEnterInfo.row,this.cellRowEnterInfo.column,this.cellRowEnterInfo.cell,employeeId,cardId,typeof cardId,cardInfo,employeeInfo)
        // 判断是否卡片是否绑定了订单
        if(cardInfo.employeeId){
          // 卡片已绑定员工,判断拖拽前后是否同一个员工
          console.log(cardInfo.employeeId,employeeId)
          if(cardInfo.employeeId+''!==employeeId){
            // 提示是否需要修改绑定员工
            // todo 客户卡片绑定员工 1.已经绑定了员工，如果员工不一样,则警告是否需要修改2.未绑定员工,提示是否绑定该员工
            ElMessageBox.confirm(
                '是否需要将该卡片的员工 ['+oldEmployeeInfo.nickName+'] 更改成 ['+employeeInfo.nickName+']',
                'Warning',
                {
                  confirmButtonText: 'OK',
                  cancelButtonText: 'Cancel',
                  type: 'warning',
                }
            )
                .then(() => {
                  // 仿更改处理

                  // let index=this.tableDataFromEnd[cardInfo.employeeId].findIndex(e=>e.id==cardInfo.id)
                  // this.tableDataFromEnd[cardInfo.employeeId].splice(index,1)
                  // console.log('查询旧的绑定并删除',index,cardInfo,this.tableDataFromEnd[cardInfo.employeeId])
                  // cardInfo['employeeId']=employeeId
                  // if(this.tableDataFromEnd[employeeId]){
                  //   this.tableDataFromEnd[employeeId].push(cardInfo)
                  // }else{
                  //   this.tableDataFromEnd[employeeId]=[]
                  //   this.tableDataFromEnd[employeeId].push(cardInfo)
                  // }
                  updateCardInfo({cardId:cardInfo.cardId,employeeId:employeeId}).then(res=>{
                    this.getTableData()
                    // 关闭拖拽悬浮样式
                    this.cancelDragHoverStyle()
                    ElMessage({
                      type: 'success',
                      message: '更改员工成功',
                    })
                  })

                  // this.getTableData()
                  //
                  // // 关闭拖拽悬浮样式
                  // this.cancelDragHoverStyle()
                  // ElMessage({
                  //   type: 'success',
                  //   message: '更改员工成功',
                  // })
                })
                .catch(() => {
                  // 关闭拖拽悬浮样式
                  this.cancelDragHoverStyle()
                  ElMessage({
                    type: 'info',
                    message: '用户取消或更改失败',
                  })
                })
          }else{
            // 关闭拖拽悬浮样式
            this.cancelDragHoverStyle()
            // 提示卡片已经绑定了该用工,请不要频繁操作
            ElMessage({
              message: '该卡片已经绑定了该用工,请不要频繁操作',
              type: 'warning',
            })
          }
        }else{
          // 确认绑定员工
          ElMessageBox.confirm(
              '是否需要将该卡片绑定员工至['+employeeInfo.nickName+']',
              'Warning',
              {
                confirmButtonText: 'OK',
                cancelButtonText: 'Cancel',
                type: 'warning',
              }
          )
              .then(() => {
                // 仿绑定处理
                cardInfo['employeeId']=employeeId
                // if(this.tableDataFromEnd[employeeId]){
                //   this.tableDataFromEnd[employeeId].push(cardInfo)
                // }else{
                //   this.tableDataFromEnd[employeeId]=[]
                //   this.tableDataFromEnd[employeeId].push(cardInfo)
                // }

                updateCardInfo({cardId:cardInfo.cardId,employeeId:employeeId}).then(res=>{
                  this.getTableData()
                  // 关闭拖拽悬浮样式
                  this.cancelDragHoverStyle()
                  ElMessage({
                    type: 'success',
                    message: '绑定员工成功',
                  })
                })


              })
              .catch(() => {
                // 关闭拖拽悬浮样式
                this.cancelDragHoverStyle()
                ElMessage({
                  type: 'info',
                  message: '用户取消或绑定失败',
                })
              })
        }
      }catch (e) {
        console.log('拖拽时发生异常',e)
      }


    },

    eventChange(event){
      this.getTableData()
      console.log('eventChange',event)
    },

    // 在事件信息被修改之前（如果持续时间发生了变化），在触发 eventResize 回调之前触发。
    eventResizeStop(event){
      console.log('在事件信息被修改之前（如果持续时间发生了变化），在触发 eventResize 回调之前触发',event)
    },

    // 关闭拖拽悬浮样式
    cancelDragHoverStyle(){
      console.log(this.cellRowEntering,'this.cellRowEntering')
      let columnDom=document.getElementsByClassName(this.cellRowEntering)
      Array.from(columnDom).forEach(item=>{
        // console.log('鼠标进入当前列时修改列样式',item,column.id,item.classList)
        item.classList.remove(['column-table-hover'])
      })
      this.cellRowEnterInfo={}
      this.cellRowEntering=''
    },

    // 预约表点击表格事件
    handleDateSelect(selectInfo) {
      // todo 移动端点击不处理
      if(!isMobile()){
        // let title = prompt('Please enter a new title for your event')
        let calendarApi = selectInfo.view.calendar

        calendarApi.unselect() // clear date selection
        this.addCardInfoForm.start=moment(selectInfo.start).format('yyyy-MM-DD HH:mm:ss')
        this.$refs.cardInfoFormDrawerRef.openDrawer()

        // if (title) {
        //   // let item=JSON.parse(JSON.stringify(this.calendarOptions.resources[1]))
        //   let item={}
        //   item.id=uuidv4()
        //   item.resourceId=item.id
        //   // if(item.hasOwnProperty('cardId')){
        //   //   delete item['cardId']
        //   // }
        //   // item.resourceId='add'
        //   item.title=title
        //   item.cardName=title
        //   item.start=moment(selectInfo.start).format('yyyy-MM-DD HH:mm:ss')
        //   item.end=moment(selectInfo.start).add(Math.floor(Math.random() * 5) + 1,'hour').format('yyyy-MM-DD HH:mm:ss')
        //   // this.cardInfoFromEnd.push(item)
        //   addCardInfo(item).then(res=>{
        //     this.getTableData()
        //   })
        //
        //
        //
        // }
      }
    },
    handleEventClick(clickInfo) {
      return false
      // alert('用户点击'+JSON.stringify(clickInfo))
    },
    handleEvents(events) {
      this.currentEvents = events
    },
    onEventResize(event,dayDelta,minuteDelta,allDay,revertFunc){
      console.log('事件时间区间调整',event)
    },
    eventMouseLeaveMethod(event,dayDelta,minuteDelta){
      console.log('鼠标移出事件发生的事件')
    },
    // drop(date, allDay) {
    //   let typeNumber = null
    //   const firstChildName = null
    //   const obj = {
    //     name: date.draggedEl.firstChild.innerHTML,
    //     day:Date.parse(moment(date.dateStr).format()), // 开始时间
    //     dayEnd:  Date.parse(moment(date.dateStr).add(date.draggedEl.lastChild.innerHTML, 'days').format()), // 结束时间
    //     dayNum: date.draggedEl.lastChild.innerHTML,
    //   }
    //   // 拖拽后，新增日历活动接口调用
    //   holidayAdd(obj).then(res=>{
    //     if(res.status === '200') {
    //       console.log(res, 'data')
    //       const data = res.data
    //       this.holidayEvent() // 调用获取视图活动数据方法
    //     }
    //   })
    // }
    deleteRow(index){
      this.tableData.splice(index, 1)
    },
    // 鼠标进入表格行的回调函数
    enterSelectionRows(row, column, cell,event){
      // console.log('鼠标进入表格行的回调函数',event,event.fromElement.classList,Array.from(event.fromElement.classList).findIndex(e=> e.indexOf('fc-')>-1))
      if(event.fromElement && (Array.from(event.fromElement.classList).findIndex(e=> e.indexOf('fc-event')>-1)>-1 || event.fromElement.getAttribute('resource-id') || (event.fromElement.firstElementChild && event.fromElement.firstElementChild.getAttribute('resource-id'))) && this.cellRowEntering!==column.id){
        console.log('鼠标进入表格行的回调函数',event,event.fromElement.getAttribute('resource-id'))
        this.cellRowEnterInfo={row, column, cell,event}
      }
    },
    // 鼠标离开表格行的回调函数
    leaveSelectionRows (row,column){
      // alert('鼠标离开表格行的回调函数')
    },
    // 开始拖拽
    dragStart(event, jsEvent, ui, view) {
      // 找出recourceId
      const ev=event
      // console.log('开始拖拽',event)
      // event.jsEvent.preventDefault()
      // console.log('开始拖拽',event,event.event._def.resourceIds[0])
      // ev.dataTransfer.effectAllowed = 'move';
      // ev.dataTransfer.setData("Text", ev.target.getAttribute('id'));
      // ev.dataTransfer.setDragImage(ev.target, 0, 0);
      return true;
    },
    dragStop(event, jsEvent, ui, view) {
      // console.log('dragStop',!!this.cellRowEnterInfo,Object.keys(this.cellRowEnterInfo).length)
      if(Object.keys(this.cellRowEnterInfo).length>0){
        const row=this.cellRowEnterInfo.row
        const column=this.cellRowEnterInfo.column
        const cell=this.cellRowEnterInfo.cell
        const event=this.cellRowEnterInfo.event
        if(event.fromElement && (Array.from(event.fromElement.classList).findIndex(e=> e.indexOf('fc-')>-1)>-1 || event.fromElement.getAttribute('resource-id') || (event.fromElement.firstElementChild && event.fromElement.firstElementChild.getAttribute('resource-id'))) && this.cellRowEntering!==column.id){
          // 鼠标进入当前列时修改列样式
          let columnDom=document.getElementsByClassName(column.id)
          // console.log('鼠标进入当前列时修改列样式',columnDom,columnDom.length)
          Array.from(columnDom).forEach(item=>{
            // console.log('鼠标进入当前列时修改列样式',item,column.id,item.classList)
            item.classList.add(['column-table-hover'])
          })
          this.cellRowEntering=column.id
          let cardId = ''
          if(event.fromElement.getAttribute('resource-id')){
            cardId=event.fromElement.getAttribute('resource-id')
          }else if(event.fromElement.firstElementChild && event.fromElement.firstElementChild.getAttribute('resource-id')){
            cardId=event.fromElement.firstElementChild.getAttribute('resource-id')
          }else if(event.fromElement.firstElementChild && event.fromElement.firstElementChild.firstElementChild && event.fromElement.firstElementChild.firstElementChild.getAttribute('resource-id')){
            cardId=event.fromElement.firstChild.firstElementChild.getAttribute('resource-id')
          }else if(event.fromElement.parentElement.firstElementChild && event.fromElement.parentElement.firstElementChild.getAttribute('resource-id')){
            cardId=event.fromElement.parentElement.firstElementChild.getAttribute('resource-id')
          }else if(event.fromElement.parentElement.firstElementChild && event.fromElement.parentElement.firstElementChild.firstElementChild && event.fromElement.parentElement.firstElementChild.firstElementChild.getAttribute('resource-id')){
            cardId=event.fromElement.parentElement.firstElementChild.firstElementChild.getAttribute('resource-id')
          }


          this.cardBindEmployee(cardId,column.property)
        }
      }
      return true;
    },
    dragEnter(ev) {
      console.log('dragEnter',ev)
      return true;
    },
    dragOver(ev) {
      console.log('dragOver',ev)
      ev.preventDefault();
      return false;
    },
    dragDrop(ev) {
      var src = ev.dataTransfer.getData("Text");
      console.log('移动的dom',src, ev.target)
      this.onAddItem()
      ev.stopPropagation();
      return true;
    },

    filterEmployeeName(employeeId){
      const employeeInfo=this.employeeList.find(e=>e.employeeId===employeeId)
      if(employeeInfo){
        return employeeInfo.nickName
      }else{
        return '未绑定员工'
      }
    },

    isToday(){
      if(this.selectDate===moment().format('YYYY-MM-DD')){
        return true
      }else{
        return false
      }
    },

    formatDate(date,format){
      return moment(date).format(format)
    }
  }

})

</script>
<style>
.el-popover__title {
  color: var(--el-popover-title-text-color);
  font-size: var(--el-popover-title-font-size);
  line-height: 1;
  margin-bottom: 12px;
  display: none;
}

.el-popover{
  padding: 5px !important;
}
</style>
<style scoped>

.isPay{
  width: 100%;
  height: 100%;
  background: #9ad6d0 !important;
  color: white !important;
  font-size: 12px;
}
.unPay{
  width: 100%;
  height: 100%;
  color: #ac9a9a !important;
  font-size: 12px;
  background: #f8efef !important;
}
.appover_image{
  width: 100%;
  display: block;
}
.head_bg{
  background: #1989fa !important;
  color: white;
}


:deep(.el-table th.el-table__cell) {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-color: transparent !important;
}

.header_title{
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
:deep(.fc-direction-ltr){
  direction: ltr;
  text-align: left;
  height: 100%;
  /*overflow-y: scroll;*/
}

:deep(.column-table-hover){
  background: rgba(231, 221, 221, 0.99);
}

:deep(.el-table td.el-table__cell){
  border-bottom: none !important;
}
:deep(.el-table th.el-table__cell.is-leaf) {
  border-bottom: none !important;
}

.demo-app {
  width: 100%;
  height:calc(100vh - 84px);
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
  box-sizing: border-box;
}
.demo-app-main-bottom {
  width: 100%;
  height: calc(33% - 36px);
}

.demo-app-main-top {
  width: 100%;
  height: calc(67% - 36px);
}

.fc-license-message{
  display: none;
}

.service_container{
  width: 100%;
  padding:0;
}

.service_title{
  width: 100%;
  height: 28px;
  line-height: 28px;
  text-align: left;
  font-size: 12px;
}

.service_body{
  height: 36px;
  overflow-y: scroll;
  overflow-x: hidden;
}

.service_body::-webkit-scrollbar {
  display: none;
}
.service_body .service_body_tag{
  font-size: 10px !important;
  line-height: 18px !important;
  height: 18px !important;
  margin-right: 3px;
}

.sevice_footer{
  font-size: 10px;
  line-height: 18px;
  height: 18px;
  text-align: center;
}
.card_header{
  width: 100%;
  height: 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
:deep(.el-card__body) {
  padding: 2px !important;
}

:deep(.el-card__header){
  padding: 2px !important;
}

/*:deep(.fc-h-event){*/
/*  border:none!important;*/
/*}*/

:deep(.el-card__footer){
  padding: 2px !important;
}

.line_card{
  border-radius: 4px;
  padding:0px 0PX;
  /*display: flex;*/
  justify-content: space-between;
  align-items: center;
}

:deep(.fc-timeline-event-harness){
  top: 5px !important;
}

:deep(.fc-timeline-event){
  padding:0 !important;
}

:deep(.fc-timeline-slot-frame) {
  justify-content: center !important;
}

#fullCalendar{
  width: 100%;
  overflow-x: scroll;
  height:100%
}
.toolbar-boxer {
  height:36px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.top-toolbar-boxer {
  position: relative;
  width: 100%;
  height:36px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  overflow: scroll;
}

.toolbar-right {
  text-align: right;
}

.top-toolbar-right{
  margin-right: 15px;
  height: 18px;
  text-align: right;
}

.demo-date-picker {
  display: flex;
  width: 100%;
  padding: 0;
  flex-wrap: wrap;
}

.demo-date-picker .block {
  padding: 30px 0;
  text-align: center;
  border-right: solid 1px var(--el-border-color);
  flex: 1;
}

.demo-date-picker .block:last-child {
  border-right: none;
}

.demo-date-picker .demonstration {
  display: block;
  color: var(--el-text-color-secondary);
  font-size: 14px;
  margin-bottom: 20px;
}

:deep(.fc .fc-cell-shaded){
  display: none !important;
}

:deep(.fc .fc-day-disabled){
  display: none !important;
}

:deep(.fc .fc-scrollgrid-section-footer > *){
  display: none!important;
}



:deep(.fc-view-harness .fc-license-message){
  display: none;
}



/*@media screen and (-webkit-min-device-pixel-ratio:0) {*/
/*  !*这里很重要，如果删掉会导致谷歌不兼容*!*/
/*  :deep(.fc .fc-scrollgrid) {*/
/*    table-layout: fixed;*/
/*    margin: 0 auto;*/
/*    width:auto;*/
/*  }*/
/*  :deep(.fc .fc-scrollgrid-liquid) {*/
/*    height: 100%;*/
/*    width: 100%;*/
/*    overflow-x: hidden;*/
/*  }*/

/*}*/

:deep(.fc .fc-scrollgrid-liquid) {
  height: 100%;
  /*width: 200%;*/
  width: 100%!important;
  overflow-x: hidden;
}




/*:deep(.fc .fc-scroller-liquid-absolute) {*/
/*    width: 100%;*/
/*    overflow: hidden !important;;*/
/*}*/

:deep(.fc table) {
   border-collapse: unset;
  border-spacing: 0px;
  font-size: 1em;
}
:deep(.fc-scroller-harness){
  width: 200vw;
  background: white;
}

:deep(.fc .fc-scrollgrid-section-header > th:first-child){
  display: none!important;
}

/*:deep(.fc .fc-scrollgrid-section-header > th:last-child){*/
/*  width: 100%!important;*/
/*  border-bottom: 1px solid var(--el-border-color);*/
/*}*/
:deep(.fc .fc-scrollgrid-section-header > th:last-child){
  width: 200vw!important;
}



:deep(.fc .fc-scrollgrid-section-liquid > td:first-child){
  display: none!important;
}

:deep(.fc .fc-timeline-event-harness){
  position: absolute!important;
  top: 0px!important;
  border: 0.25px solid transparent!important;
}

:deep(.fc .fc-timeline-more-link){
  position: absolute!important;
  top: 0px!important;
  border: 0.25px solid transparent!important;
}

:deep(.fc-direction-ltr .fc-timeline-event.fc-event-end) {
  margin-top: 7px;
}

.cancel-button-style{
  height: 18px;
  background: transparent;
  color: rgb(172, 154, 154);
  border:none;
  outline:none;
}
.cancel-button-style:last-child{
  margin-right: 0px;
}


:deep(.cancel-button-style:hover){
  outline:none!important;
}

:deep(.cancel-button-style:focus){
  outline:none!important;
}

.pay-tip{
  padding-left: 120px;
}
.error-tip{
 color: red;
}

.success-tip{
  color: #d1edc4;
}

.divider-js {
  margin: 8px 0;
  background: 0 0;
  border-top: 2px dashed rgba(28, 27, 27, 0.48);
}

.top-toolbar-left{
  position: absolute;left:0px;top:0;z-index: -1;width: 100%;height: 100%;line-height: 36px;text-align: left;padding:0 30px ;
}

#dragLine:hover{
  cursor: row-resize;
}

/* 拖拽时禁用过渡动画，避免延迟和跳转 */
#container-top.dragging{transition: none !important}
#container-bottom.dragging{transition: none !important}
/* 正常状态下的过渡动画 */
#container-top{transition: height .1s ease-in-out}
#container-bottom{transition: height .1s ease-in-out}

#fullCalendar::-webkit-scrollbar {
  height: 12px;
}

#fullCalendar::-webkit-scrollbar-thumb {
  background-color: rgba(88, 170, 255, 0.42);
  border-radius: 3px;
}
:deep(.el-table){
  background-color: transparent;
}
</style>
