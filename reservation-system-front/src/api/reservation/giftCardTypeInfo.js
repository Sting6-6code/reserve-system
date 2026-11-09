import request from '@/utils/request'

// 查询礼品卡类型列表
export function listGiftCardTypeInfo(query) {
  return request({
    url: '/reservation/giftCardTypeInfo/list',
    method: 'get',
    params: query
  })
}

// 查询礼品卡类型详细
export function getGiftCardTypeInfo(giftCardTypeId) {
  return request({
    url: '/reservation/giftCardTypeInfo/' + giftCardTypeId,
    method: 'get'
  })
}

// 新增礼品卡类型
export function addGiftCardTypeInfo(data) {
  return request({
    url: '/reservation/giftCardTypeInfo',
    method: 'post',
    data: data
  })
}

// 修改礼品卡类型
export function updateGiftCardTypeInfo(data) {
  return request({
    url: '/reservation/giftCardTypeInfo',
    method: 'put',
    data: data
  })
}

// 删除礼品卡类型
export function delGiftCardTypeInfo(giftCardTypeId) {
  return request({
    url: '/reservation/giftCardTypeInfo/' + giftCardTypeId,
    method: 'delete'
  })
}
