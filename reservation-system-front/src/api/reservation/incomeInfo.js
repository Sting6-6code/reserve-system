import request from '@/utils/request'

// 查询收入管理列表
export function listIncomeInfo(query) {
  return request({
    url: '/system/incomeInfo/list',
    method: 'get',
    params: query
  })
}

// 查询收入管理详细
export function getIncomeInfo(id) {
  return request({
    url: '/system/incomeInfo/' + id,
    method: 'get'
  })
}

// 新增收入管理
export function addIncomeInfo(data) {
  return request({
    url: '/system/incomeInfo',
    method: 'post',
    data: data
  })
}

// 修改收入管理
export function updateIncomeInfo(data) {
  return request({
    url: '/system/incomeInfo',
    method: 'put',
    data: data
  })
}

// 删除收入管理
export function delIncomeInfo(id) {
  return request({
    url: '/system/incomeInfo/' + id,
    method: 'delete'
  })
}
