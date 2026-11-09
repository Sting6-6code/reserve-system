import request from '@/utils/request'

// 查询员工管理列表
export function listEmployeeInfo(query) {
  return request({
    url: '/system/employeeInfo/list',
    method: 'get',
    params: query
  })
}

// 查询员工管理详细
export function getEmployeeInfo(employeeId) {
  return request({
    url: '/system/employeeInfo/' + employeeId,
    method: 'get'
  })
}

// 新增员工管理
export function addEmployeeInfo(data) {
  return request({
    url: '/system/employeeInfo',
    method: 'post',
    data: data
  })
}

// 修改员工管理
export function updateEmployeeInfo(data) {
  return request({
    url: '/system/employeeInfo',
    method: 'put',
    data: data
  })
}

// 删除员工管理
export function delEmployeeInfo(employeeId) {
  return request({
    url: '/system/employeeInfo/' + employeeId,
    method: 'delete'
  })
}
