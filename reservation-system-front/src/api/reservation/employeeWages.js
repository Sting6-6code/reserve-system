import request from '@/utils/request'

// 查询预约卡片管理列表
export function listEnployeeWages(query) {
  return request({
    url: '/reservation/enployeeWages/list',
    method: 'get',
    params: query
  })
}
