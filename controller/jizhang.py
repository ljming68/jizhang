from flask import Blueprint,session,jsonify,request,json
from model.record import Record
from model.account import Account
from model.count import Count
from common import utlis,counts
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

      count = Count()
      count.insert_money(amount,recordtime,inandouttype)

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

# 删除记录 用户删除
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
    counts.update_count()
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
    counts.update_count()
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

@jizhang.route('/recordlist',methods=['POST'])
def searchrecord():
  page = int(request.args.get('page'))
  size = int(request.args.get('size'))
  total = int(request.args.get('total'))

  mark = request.form.get('mark').strip()
  content = request.form.get('content').strip()
  print(mark,content)

  start = (page - 1) * size
  record = Record()
  result = []
  # 判断 content 类型
  if mark == 'category':
    result = record.find_record_by_category(content,start,size)
  elif mark == 'type':
    result = record.find_record_by_type(content,start,size)
  elif mark == 'recordtime':
    date = content.split('--')
    start_day = date[0]
    end_day = date[1]
    result = record.find_record_by_date(start_day,end_day,start,size)
  elif mark == 'amount':
    content = float(content)
    result = record.find_record_by_amount(content,start,size)
  elif mark == 'note':
    result = record.find_record_by_note(content,start,size)

  
  print(result)
  # result = record.find_record_by_keyword(content,start,size)
  if result:
    data = list(result)
    print(data)
    rows = utlis.model_to_list(data[0])
    total = data[1]
    
    data = {}
    data['rows'] = rows
    data['total'] = total
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = data

  return jsonify(res)

# 添加记录 批量添加
@jizhang.route('/records',methods=['POST'])
def add_records():

  # json 处理传过来的payload数据
  records = request.form.get("records")
  data_list = json.loads(records)
  print(data_list)
  record = Record()
  result = record.batch_records(data_list)


  if result:
    res = {'code':10000,'message':'操作成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  
  return jsonify(res)

# 导出账单
@jizhang.route('/exportrecords',methods=['POST'])
def export_records():
  start_day = request.form.get('startDate')
  end_day = request.form.get('endDate')
  print(start_day,end_day)

  record = Record()
  result = record.export_records(start_day,end_day)

  # 表头
  names = 'category amount type recordtime note payid'.split()
  rows = [dict(zip(names, r)) for r in result]
  account = Account()
  # print(rows)
  for item in rows:
    if(item['type'] == 0):
      item['type'] = '支出'
    else:
      item['type'] = '收入'

    item['amount'] = math.fabs(item['amount'])
    if item['payid'] != None:
      res = account.find_by_payid(item['payid'])
      item['payid'] = res.payname
  # print(rows)

  data = {}
  data['rows'] = rows
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)