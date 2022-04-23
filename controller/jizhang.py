from flask import Blueprint,session,jsonify,request
from model.record import Record
from model.account import Account
from common import utlis
import math
jizhang = Blueprint('jizhang',__name__)

@jizhang.before_request
def before():
  if session.get('roleid') == 1:
    res = {'code':10002,'message':'没有权限','success':False}
    return jsonify(res)

# 添加记录 更新对应账户
@jizhang.route('/record',methods=['POST'])
def add_record():
  # recordname = request.form.get('recordname').strip()
  category = request.form.get('category').strip()
  amount = request.form.get('amount').strip()
  recordtime = request.form.get('recordtime').strip()
  inandouttype = request.form.get('inandouttype').strip()
  note = request.form.get('note').strip()
  payid = request.form.get('payid').strip()

  # 校验信息
  # piyid 为 null
  if payid == '':
    payid = None

  # 调整 amount 的值
  amount = math.fabs(float(amount))
  amount = round(amount,2)
  if int(inandouttype) == 0:
    amount = -amount
    # print('=====',amount)
  # print('----',amount)
  # 插入记录
  record = Record()
  # print(session.get('userid'))
  result = record.insert_record(category,amount,recordtime,inandouttype,note,payid)
  # print(result)
  if result:
    if payid:
      account = Account()
      account.update_balance(payid,amount)
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  
  return jsonify(res)
      

# 获取纪录列表
@jizhang.route('/recordlist')
def recordlist():
  page = int(request.args.get('page'))
  size = int(request.args.get('size'))
  total = int(request.args.get('total'))

  start = (page - 1) * size
  record = Record()
  result = record.find_record_by_userid(start,size)
  total = record.get_record_count()
  rows = utlis.model_to_list(result)
  print(result)
  # print(rows,total)
  data = {}
  data['rows'] = rows
  data['total'] = total
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

# 删除记录 
@jizhang.route('/record/<int:recordid>',methods=['DELETE'])
def del_record(recordid):
  record = Record()
  result = record.find_record_by_recordid(recordid)
  preamount = result[0].amount
  # prepayid = None
  account = Account()
  if result[0].payid:
    prepayid = result[0].payid
    account.update_balance(prepayid,-preamount)

  if len(result) == 1:
    record.del_record_by_recordid(recordid)
    res = {'code':10000,'message':'删除成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}
  
  return jsonify(res)

# 更新记录
@jizhang.route('/record/<int:recordid>',methods=['PUT'])
def update_record(recordid):
  
  category = request.form.get('category').strip()
  amount = request.form.get('amount').strip()
  recordtime = request.form.get('recordtime').strip()
  inandouttype = request.form.get('inandouttype').strip()
  note = request.form.get('note').strip()
  payid = request.form.get('payid').strip()

  # 校验信息
  # piyid 为 null
  if payid == '':
    payid = None
  
  # 处理 原纪录信息
  record = Record()
  result = record.find_record_by_recordid(recordid)
  preamount = result[0].amount
  prepayid = None
  account = Account()
  if result[0].payid:
    prepayid = result[0].payid
    
    account.update_balance(prepayid,-preamount)

  # print(preamount,prepayid)
  
  # 调整 amount 的值
  amount = math.fabs(float(amount))
  amount = round(amount,2)
  if int(inandouttype) == 0:
    amount = -amount
  # #账户
  
  dicts = {}
  dicts['category'] = category
  dicts['amount'] = amount
  dicts['recordtime'] = recordtime
  dicts['type'] = inandouttype
  dicts['note'] = note
  dicts['payid'] = payid
  # print(dicts)
  result2 = record.update_record(recordid,dicts)
  if payid:
    account.update_balance(payid,amount)
  # print(result2)
  if result2:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)

# 根据id 获取记录
@jizhang.route('/record/<int:recordid>')
def get_account(recordid):
  record = Record()
  result = record.find_record_by_recordid(recordid)
  row = utlis.model_to_list(result)
  # print(result)
  if result:
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = row
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)