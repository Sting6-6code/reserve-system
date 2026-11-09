import request from '@/utils/request'

// 查询预约客户管理列表
export function listCostomInfo(query) {
  return request({
    url: '/reservation/costomInfo/list',
    method: 'get',
    params: query
  })
}

// 查询预约客户管理详细
export function getCostomInfo(customId) {
  return request({
    url: '/reservation/costomInfo/' + customId,
    method: 'get'
  })
}

// 新增预约客户管理
export function addCostomInfo(data) {
  return request({
    url: '/reservation/costomInfo',
    method: 'post',
    data: data
  })
}

// 修改预约客户管理
export function updateCostomInfo(data) {
  return request({
    url: '/reservation/costomInfo',
    method: 'put',
    data: data
  })
}

// 删除预约客户管理
export function delCostomInfo(customId) {
  return request({
    url: '/reservation/costomInfo/' + customId,
    method: 'delete'
  })
}
