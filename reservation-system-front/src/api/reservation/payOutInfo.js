import request from '@/utils/request'

// 查询支出管理列表
export function listPayOutInfo(query) {
  return request({
    url: '/system/payOutInfo/list',
    method: 'get',
    params: query
  })
}

// 查询支出管理详细
export function getPayOutInfo(id) {
  return request({
    url: '/system/payOutInfo/' + id,
    method: 'get'
  })
}

// 新增支出管理
export function addPayOutInfo(data) {
  return request({
    url: '/system/payOutInfo',
    method: 'post',
    data: data
  })
}

// 修改支出管理
export function updatePayOutInfo(data) {
  return request({
    url: '/system/payOutInfo',
    method: 'put',
    data: data
  })
}

// 删除支出管理
export function delPayOutInfo(id) {
  return request({
    url: '/system/payOutInfo/' + id,
    method: 'delete'
  })
}

// 获取支出数据
export function payOutAmount(data) {
  return request({
    url: '/system/payOutInfo/payOutAmount',
    method: 'post',
    data: data
  })
}
