from flask import Blueprint,session,jsonify,request
from model.record import Record
from model.account import Account
from common import utlis

pay = Blueprint('pay',__name__)

@pay.before_request
def before():
  if session.get('roleid') == 1:
    res = {'code':10002,'message':'没有权限','success':False}
    return jsonify(res)

# 获取账户列表
@pay.route('/accountlist')
def accountlist():
  page = int(request.args.get('page'))
  size = int(request.args.get('size'))
  total = int(request.args.get('total'))

  start = (page - 1) * size
  account = Account()
  print(session.get('userid'))
  result = account.find_account_by_userid(start,size)
  total = account.get_account_count()
  rows = utlis.model_to_list(result)
  print(rows,total)

  data = {}
  data['rows'] = rows
  data['total'] = total
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

# 添加账户
@pay.route('/account',methods=['POST'])
def add_account():

  payname = request.form.get('payname').strip()
  balance = request.form.get('balance').strip()
  paytypeid = request.form.get('paytypeid').strip()

  # 校验信息

  #插入 账户
  account = Account()
  result = account.insert_account(payname,balance,paytypeid)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 删除账户
@pay.route('/account/<int:payid>',methods=['DELETE'])
def del_account(payid):
  account = Account()
  result = account.find_by_payid(payid)
  # print(result)
  if result:
    account.del_account_by_payid(payid)
    # 删除成功  用户表有个 总金额 更新
    res = {'code':10000,'message':'删除成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 更新账户
@pay.route('/account/<int:payid>',methods=['PUT'])
def update_record(payid):
  
  res = {'code':10000,'message':'更新成功','success':True}
  return jsonify(res)