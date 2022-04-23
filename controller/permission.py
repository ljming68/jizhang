from flask import Blueprint,session,jsonify,request
from common import utlis
from model.permission import Permission
import math

permission = Blueprint('permission',__name__)

@permission.before_request
def before():
  if session.get('roleid') != 0:
    res = {'code':10002,'message':'没有权限','success':False}
    return jsonify(res)

# 获取权限列表
@permission.route('/permissionlist')
def permissionlist():

  permission = Permission()
  result = permission.find_all()
  total = permission.get_permission_count()
  rows = utlis.model_to_list(result)
  print(rows,total)

  data = {}
  data['rows'] = rows
  data['total'] = total
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

# 添加权限
@permission.route('/permission',methods=['POST'])
def add_permission():

  name = request.form.get('name').strip()
  code = request.form.get('code').strip()
  description = request.form.get('description').strip()

  # 校验信息

  #插入 权限
  permission = Permission()
  result = permission.insert_permission(name,code,description)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 删除权限
@permission.route('/permission/<int:pid>',methods=['DELETE'])
def del_account(pid):
  
  # 先删除 roleper 表中的关联数据
  # roleper = Roleper()
  # roleper.del_roleper_by_pid(pid)

  permission = Permission()
  result = permission.find_by_pid(pid)
  if result:
    permission.del_permission_by_pid(pid)
    res = {'code':10000,'message':'删除成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 更新权限
@permission.route('/permission/<int:pid>',methods=['PUT'])
def update_account(pid):
  
  name = request.form.get('name').strip()
  code = request.form.get('code').strip()
  description = request.form.get('description').strip()

  # 校验信息


  # 准备
  permission = Permission()
  dicts = {}
  dicts['name'] = name
  dicts['code'] = code
  dicts['description'] = description
  # print(dicts)
  result = permission.update_permission(pid,dicts)
  # print(result)
  if result:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)