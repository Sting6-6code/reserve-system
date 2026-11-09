import request from '@/utils/request'

// 查询礼品卡出售记录列表
export function listGiftCardSellRecord(query) {
  return request({
    url: '/reservation/giftCardSellRecord/list',
    method: 'get',
    params: query
  })
}

// 查询礼品卡出售记录详细
export function getGiftCardSellRecord(id) {
  return request({
    url: '/reservation/giftCardSellRecord/' + id,
    method: 'get'
  })
}

// 新增礼品卡出售记录
export function addGiftCardSellRecord(data) {
  return request({
    url: '/reservation/giftCardSellRecord',
    method: 'post',
    data: data
  })
}

// 修改礼品卡出售记录
export function updateGiftCardSellRecord(data) {
  return request({
    url: '/reservation/giftCardSellRecord',
    method: 'put',
    data: data
  })
}

// 删除礼品卡出售记录
export function delGiftCardSellRecord(id) {
  return request({
    url: '/reservation/giftCardSellRecord/' + id,
    method: 'delete'
  })
}
