from flask import Blueprint,session,jsonify,request
from model.record import Record
from model.account import Account
from model.accounttype import Accounttype
from common import utlis
import math

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
  # print(session.get('userid'))
  result = account.find_account_by_userid(start,size)
  total = account.get_account_count()
  rows = utlis.model_to_list(result)
  # print(rows,total)

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
  num = (int(paytypeid) // 10) % 10
  # print(num)
  if num == 2:
    balance = - float(balance) 

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
  
  # 先删除 账户关联记录
  record = Record()
  record.del_record_by_payid(payid)
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
def update_account(payid):
  
  payname = request.form.get('payname').strip()
  balance = request.form.get('balance').strip()
  paytypeid = request.form.get('paytypeid').strip()

  # 校验信息

  #账户
  account = Account()
  dicts = {}
  dicts['payname'] = payname
  dicts['balance'] = balance
  dicts['paytypeid'] = paytypeid
  # print(dicts)
  result = account.update_account(payid,dicts)
  # print(result)
  if result:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}


  return jsonify(res)

# 获取账户类型列表
@pay.route('/accounttypelist')
def accounttypelist():

  accounttype = Accounttype()
  result = accounttype.find_all()
  rows = utlis.model_to_list(result)
  # print(rows)

  data = {}
  # data['rows'] = rows
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = rows

  return jsonify(res)

# 根据id 获取账户
@pay.route('/account/<int:payid>')
def get_account(payid):
  account = Account()
  result = account.find_by_payid(payid)
  row = utlis.one_to_list(result)
  # print(result)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = row
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)

# 转账 账户之间
@pay.route('/transaccount',methods=['POST'])
def transfer():
  payid = request.form.get('payid').strip()
  payid2 = request.form.get('payid2').strip()
  balance = request.form.get('balance').strip()
  note = request.form.get('note').strip()


  # 校验信息

  # 调整 amount 的值
  balance = math.fabs(float(balance))
  balance = round(balance,2)
  #插入 转账记录
  account = Account()
  result = account.find_by_payid(payid)
  result2 = account.find_by_payid(payid2)

  if result and result2:
    record = Record()
    record.insert_transrecord(payid,payid2,note,balance)
    account.update_balance(payid,-balance)
    account.update_balance(payid2,balance)
    
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)