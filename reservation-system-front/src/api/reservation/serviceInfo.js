import request from '@/utils/request'

// 查询服务管理列表
export function listServiceInfo(query) {
  return request({
    url: '/system/serviceInfo/list',
    method: 'get',
    params: query
  })
}

// 查询服务管理详细
export function getServiceInfo(id) {
  return request({
    url: '/system/serviceInfo/' + id,
    method: 'get'
  })
}

// 新增服务管理
export function addServiceInfo(data) {
  return request({
    url: '/system/serviceInfo',
    method: 'post',
    data: data
  })
}



// 修改服务管理
export function updateServiceInfo(data) {
  return request({
    url: '/system/serviceInfo',
    method: 'put',
    data: data
  })
}

// 删除服务管理
export function delServiceInfo(id) {
  return request({
    url: '/system/serviceInfo/' + id,
    method: 'delete'
  })
}

// 查询部门下拉树结构
export function serviceTreeSelect() {
  return request({
    url: '/system/serviceInfo/serviceTree',
    method: 'get'
  })
}
