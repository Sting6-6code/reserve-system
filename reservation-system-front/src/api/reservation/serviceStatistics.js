import request from '@/utils/request'

// 查询预约卡片管理列表
export function listServiceStatistics(query) {
  return request({
    url: '/reservation/serviceStatistics/list',
    method: 'get',
    params: query
  })
}
