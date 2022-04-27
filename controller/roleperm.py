from flask import Blueprint,session,jsonify,request
from common import utlis
from model.roleperm import Roleperm
from model.role import Role
import math,re

roleperm = Blueprint('roleperm',__name__)

@roleperm.before_request
def before():
  if session.get('roleid') != 0:
    res = {'code':10002,'message':'没有权限','success':False}
    return jsonify(res)

# 获取一个角色对应的权限
@roleperm.route('/roleperm/<int:roleid>')
def rolepermlist(roleid):

  roleperm = Roleperm()
  result = roleperm.find_roleperm_by_roleid(roleid)
  pids = utlis.tuple_to_list(result)
  # print(pids)
  role = Role()
  row = role.find_by_roleid(roleid)
  row = utlis.model_to_list(row)
  # print(row)


  data = {}
  data['row'] = row[0]
  data['pids'] = pids
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

# 添加更新权限
@roleperm.route('/roleperm',methods=['PUT'])
def add_roleperm():

  pids = request.form.get('pids').strip()
  roleid = request.form.get('roleid').strip()

  # 要更改的数据
  pidlist = re.findall(r"\d+",pids)
  lists = []
  for i in pidlist:
    dicts = {'roleid':int(roleid)}
    dicts['pid'] = int(i)
    lists.append(dicts)
  print(lists)

  #插入 角色
  roleperm = Roleperm()
  result = roleperm.update_roleperm(roleid,lists)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)