<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="服务名称" prop="serviceName">
        <el-input
          v-model="queryParams.serviceName"
          placeholder="请输入服务名称"
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
          v-hasPermi="['system:serviceInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="Sort"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="serviceInfoList"
      row-key="id"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="服务名称" prop="serviceName" />
      <el-table-column label="服务时长" align="center" prop="serviceTime" />
      <el-table-column label="服务价格" align="center" prop="servicePrice" />
      <el-table-column label="服务详情" align="center" prop="serviceDetail" />
      <el-table-column label="服务工资" align="center" prop="serviceWages" />

      <el-table-column label="当前目录" align="center" prop="id" />
      <el-table-column label="上级目录" align="center" prop="parentId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:serviceInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Plus" @click="handleAdd(scope.row)" v-hasPermi="['system:serviceInfo:add']">新增</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:serviceInfo:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改服务管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="serviceInfoRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="服务名称" prop="serviceName">
          <el-input v-model="form.serviceName" placeholder="请输入服务名称" />
        </el-form-item>
        <el-form-item label="服务时长" prop="serviceTime">
          <el-input v-model="form.serviceTime" type="number" aria-posinset="right" placeholder="请输入服务时长">
            <template #append>
              <span>分钟</span>
            </template>
          </el-input>

        </el-form-item>
        <el-form-item label="服务价格" prop="servicePrice">
          <el-input v-model="form.servicePrice" type="number" aria-posinset="right" placeholder="请输入服务价格" />
        </el-form-item>
        <el-form-item label="服务工资" prop="serviceWages">
          <el-input v-model="form.serviceWages" type="number" aria-posinset="right" placeholder="请输入服务工资" />
        </el-form-item>
        <el-form-item label="服务详情" prop="serviceDetail">
          <el-input v-model="form.serviceDetail" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="上级目录" prop="parentId">
          <el-tree-select
            v-model="form.parentId"
            :data="serviceInfoOptions"
            :props="{ value: 'id', label: 'serviceName', children: 'children' }"
            value-key="id"
            placeholder="请选择上级目录"
            check-strictly
          />
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

<script setup name="ServiceInfo">
import { listServiceInfo, getServiceInfo, delServiceInfo, addServiceInfo, updateServiceInfo } from "@/api/reservation/serviceInfo";

const { proxy } = getCurrentInstance();

const serviceInfoList = ref([]);
const serviceInfoOptions = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const title = ref("");
const isExpandAll = ref(true);
const refreshTable = ref(true);

const data = reactive({
  form: {},
  queryParams: {
    serviceName: null,
  },
  rules: {
    serviceName: [
      { required: true, message: "服务名称不能为空", trigger: "blur" }
    ],
    serviceTime: [
      { required: true, message: "服务时长不能为空", trigger: "blur" }
    ],
    servicePrice: [
      { required: true, message: "服务价格不能为空", trigger: "blur" }
    ],
    serviceDetail: [
      { required: true, message: "服务详情不能为空", trigger: "blur" }
    ],
    parentId: [
      { required: true, message: "上级目录不能为空", trigger: "blur" }
    ],
    serviceWages: [
      { required: true, message: "服务工资不能为空", trigger: "blur" }
    ],

  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询服务管理列表 */
function getList() {
  loading.value = true;
  listServiceInfo(queryParams.value).then(response => {
    serviceInfoList.value = proxy.handleTree(response.data, "id", "parentId");
    loading.value = false;
  });
}

/** 查询服务管理下拉树结构 */
function getTreeselect() {
  listServiceInfo().then(response => {
    serviceInfoOptions.value = [];
    const data = { id: 0, serviceName: '顶级节点', children: [] };
    data.children = proxy.handleTree(response.data, "id", "parentId");
    serviceInfoOptions.value.push(data);
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
    serviceName: null,
    serviceTime: null,
    servicePrice: null,
    serviceDetail: null,
    serviceWages:null,
    parentId: null,
    createBy: null,
    createTime: null
  };
  proxy.resetForm("serviceInfoRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 新增按钮操作 */
function handleAdd(row) {
  reset();
  getTreeselect();
  if (row != null && row.id) {
    form.value.parentId = row.id;
  } else {
    form.value.parentId = 0;
  }
  open.value = true;
  title.value = "添加服务管理";
}

/** 展开/折叠操作 */
function toggleExpandAll() {
  refreshTable.value = false;
  isExpandAll.value = !isExpandAll.value;
  nextTick(() => {
    refreshTable.value = true;
  });
}

/** 修改按钮操作 */
async function handleUpdate(row) {
  reset();
  await getTreeselect();
  if (row != null) {
    form.value.parentId = row.parentId;
  }
  getServiceInfo(row.id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改服务管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["serviceInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateServiceInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addServiceInfo(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除服务管理编号为"' + row.id + '"的数据项？').then(function() {
    return delServiceInfo(row.id);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

getList();
</script>
