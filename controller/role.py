from flask import Blueprint,session,jsonify,request
from common import utlis
from model.role import Role
from model.roleperm import Roleperm
import math

role = Blueprint('role',__name__)

@role.before_request
def before():
  if session.get('roleid') != 0:
    res = {'code':10002,'message':'没有权限','success':False}
    return jsonify(res)

# 获取角色列表
@role.route('/rolelist')
def rolelist():

  role = Role()
  result = role.find_all()
  # total = role.get_role_count()
  rows = utlis.model_to_list(result)
  print(rows)

  data = {}
  data['rows'] = rows
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

# 添加角色
@role.route('/role',methods=['POST'])
def add_role():

  identity = request.form.get('identity').strip()
  description = request.form.get('description').strip()

  # 校验信息

  #插入 角色
  role = Role()
  result = role.insert_role(identity,description)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 删除角色
@role.route('/role/<int:roleid>',methods=['DELETE'])
def del_role(roleid):
  
  # 先删除 roleperm等 表中的关联数据 同理其他表也是如此
  roleperm = Roleperm()
  result = roleperm.find_roleperm_by_roleid(roleid)
  if result:
    roleperm.del_roleperm_by_roleid(roleid)



  role = Role()
  result = role.find_by_roleid(roleid)
  if result:
    role.del_role_by_roleid(roleid)
    res = {'code':10000,'message':'删除成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 更新角色
@role.route('/role/<int:roleid>',methods=['PUT'])
def update_role(roleid):
  
  identity = request.form.get('identity').strip()
  description = request.form.get('description').strip()

  # 校验信息


  # 准备
  role = Role()
  dicts = {}
  dicts['identity'] = identity
  dicts['description'] = description
  # print(dicts)
  result = role.update_role(roleid,dicts)
  # print(result)
  if result:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)

# 根据id 获取角色
@role.route('/role/<int:roleid>')
def get_role(roleid):
  role = Role()
  result = role.find_by_roleid(roleid)
  row = utlis.model_to_list(result)
  # print(result)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = row
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)

