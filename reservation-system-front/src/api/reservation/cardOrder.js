import request from '@/utils/request'

// 查询预约卡片支付管理列表
export function listCardOrder(query) {
  return request({
    url: '/reservation/cardOrder/list',
    method: 'get',
    params: query
  })
}

// 查询预约卡片支付管理详细
export function getCardOrder(cardId) {
  return request({
    url: '/reservation/cardOrder/' + cardId,
    method: 'get'
  })
}

// 新增预约卡片支付管理
export function addCardOrder(data) {
  return request({
    url: '/reservation/cardOrder',
    method: 'post',
    data: data
  })
}

// 修改预约卡片支付管理
export function updateCardOrder(data) {
  return request({
    url: '/reservation/cardOrder',
    method: 'put',
    data: data
  })
}

// 删除预约卡片支付管理
export function delCardOrder(cardId) {
  return request({
    url: '/reservation/cardOrder/' + cardId,
    method: 'delete'
  })
}

// 获取预约卡收入
export function cardPayAmount(data) {
  return request({
    url: '/reservation/cardOrder/cardPayAmount',
    method: 'post',
    data: data
  })
}
