import request from '@/utils/request'

// 查询礼品卡订单记录列表
export function listGiftCardOrder(query) {
  return request({
    url: '/reservation/giftCardOrder/list',
    method: 'get',
    params: query
  })
}

// 查询礼品卡订单记录详细
export function getGiftCardOrder(giftCardCode) {
  return request({
    url: '/reservation/giftCardOrder/' + giftCardCode,
    method: 'get'
  })
}

// 新增礼品卡订单记录
export function addGiftCardOrder(data) {
  return request({
    url: '/reservation/giftCardOrder',
    method: 'post',
    data: data
  })
}

// 修改礼品卡订单记录
export function updateGiftCardOrder(data) {
  return request({
    url: '/reservation/giftCardOrder',
    method: 'put',
    data: data
  })
}

// 删除礼品卡订单记录
export function delGiftCardOrder(giftCardCode) {
  return request({
    url: '/reservation/giftCardOrder/' + giftCardCode,
    method: 'delete'
  })
}

// 获取礼品卡收入
export function giftCardPayAmount(data) {
  return request({
    url: '/reservation/giftCardOrder/giftCardPayAmount',
    method: 'post',
    data: data
  })
}


