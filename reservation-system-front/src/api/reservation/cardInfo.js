import request from '@/utils/request'

// 查询预约卡片管理列表
export function listCardInfo(query) {
  return request({
    url: '/system/cardInfo/list',
    method: 'get',
    params: query
  })
}

// 查询预约卡片管理详细
export function getCardInfo(cardId) {
  return request({
    url: '/system/cardInfo/' + cardId,
    method: 'get'
  })
}

// 新增预约卡片管理
export function addCardInfo(data) {
  return request({
    url: '/system/cardInfo',
    method: 'post',
    data: data
  })
}

// 批量新增服务管理
export function batchSaveServiceInfo(data) {
  return request({
    url: '/system/cardInfo/batchSave',
    method: 'post',
    data: data
  })
}

// 修改预约卡片管理
export function updateCardInfo(data) {
  return request({
    url: '/system/cardInfo',
    method: 'put',
    data: data
  })
}

// 修改预约卡片管理
export function updateCardOrder(data) {
  return request({
    url: '/system/cardInfo/order',
    method: 'put',
    data: data
  })
}

// 删除预约卡片管理
export function delCardInfo(cardId) {
  return request({
    url: '/system/cardInfo/' + cardId,
    method: 'delete'
  })
}

// 查询客户历史信息
export function getCustomerHistory(customId) {
  return request({
    url: '/system/cardInfo/customerHistory/' + customId,
    method: 'get'
  })
}