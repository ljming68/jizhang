from flask import Blueprint,session,jsonify,request
from model.record import Record
from model.count import Count
import calendar,math
from common import utlis

count = Blueprint('count',__name__)

@count.route('/categorylist',methods=['POST'])
def categorylist():
  date = request.form.get('date').strip()
  print(len(date))
  start_day = ''
  end_day = ''
  if len(date) == 4:
    # print(date)
    start_day = date + '-' + '01' + '-' + '01'
    end_day = date + '-' + '12' + '-' + '31'
  elif len(date) == 7 or len(date) == 6:
    # print(date)
    result = date.split('-')
    result = calendar.monthrange(int(result[0]),int(result[1]))
    days = result[1]
    start_day = date + '-' + '1'
    end_day = date + '-' + str(days)
  elif len(date) == 10:
    # print(date)
    start_day = date
    end_day = date


  else:
    # print('week',date)
    result = date.split('--')
    start_day = result[0]
    end_day = result[1]
  print(start_day,end_day)
  record = Record()
  inandouttype = 0
  result = record.count_category_by_days(start_day,end_day,inandouttype)
  inandouttype = 1
  result2 = record.count_category_by_days(start_day,end_day,inandouttype)
  
  
  print(result,result2)

  # 表头
  names = 'name value'.split()
  rows1 = [dict(zip(names, r)) for r in result]
  rows2 = [dict(zip(names, r)) for r in result2]
  
  data = {}
  data['rows1'] = rows1
  data['rows2'] = rows2
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

@count.route('/linelist',methods=['POST'])
def linelist():
  date = request.form.get('date').strip()
  print(len(date))
  start_day = ''
  end_day = ''
  if len(date) == 4:
    # print(date)
    start_day = date + '-' + '01' + '-' + '01'
    end_day = date + '-' + '12' + '-' + '31'
    count = Count()
    result = count.find_data_by_year(start_day,end_day)
    print('ddd',result)
    # names = 'date inmoney outmoney'.split()
    # rows = [dict(zip(names, r)) for r in result]
    names = 'month inmoney outmoney'.split()
    rows = [dict(zip(names, r)) for r in result]
    
    data = {}
    data['rows'] = rows
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = data

    return jsonify(res)
  elif len(date) == 7 or len(date) == 6:
    # print(date)
    result = date.split('-')
    result = calendar.monthrange(int(result[0]),int(result[1]))
    days = result[1]
    start_day = date + '-' + '1'
    end_day = date + '-' + str(days)
  elif len(date) == 10:
    # print(date)
    start_day = date
    end_day = date


  else:
    # print('week',date)
    result = date.split('--')
    start_day = result[0]
    end_day = result[1]

  
  print(start_day,end_day)
  count = Count()
  result = count.find_data_by_month(start_day,end_day)
  # 表头
  names = 'date inmoney outmoney'.split()
  rows = [dict(zip(names, r)) for r in result]
  # print(data)
  
  data = {}
  data['rows'] = rows
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)

@count.route('/detaillist',methods=['POST'])
def detaillist():
  date = request.form.get('date').strip()
  print(len(date))
  start_day = ''
  end_day = ''
  if len(date) == 4:
    # print(date)
    start_day = date + '-' + '01' + '-' + '01'
    end_day = date + '-' + '12' + '-' + '31'
  elif len(date) == 7 or len(date) == 6:
    # print(date)
    result = date.split('-')
    result = calendar.monthrange(int(result[0]),int(result[1]))
    days = result[1]
    start_day = date + '-' + '1'
    end_day = date + '-' + str(days)
  elif len(date) == 10:
    # print(date)
    start_day = date
    end_day = date


  else:
    # print('week',date)
    result = date.split('--')
    start_day = result[0]
    end_day = result[1]

  print(start_day,end_day)
  record = Record()
  inandouttype = 0
  result = record.count_detail_by_days(start_day,end_day,inandouttype)
  inandouttype = 1
  result2 = record.count_detail_by_days(start_day,end_day,inandouttype)
  
  
  print(result,result2)

  # 表头
  names = 'name value date'.split()
  rows1 = [dict(zip(names, r)) for r in result]
  rows2 = [dict(zip(names, r)) for r in result2]
  
  data = {}
  data['rows1'] = rows1
  data['rows2'] = rows2
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)


@count.route('/count')
def count_1():
  
  return '2'

@count.route('/billlist',methods=['POST'])
def billlist():
  date = request.form.get('date').strip()

  start_day = date + '-' + '01' + '-' + '01'
  end_day = date + '-' + '12' + '-' + '31'
  count = Count()
  result = count.count_bill(start_day,end_day)
  print(result)
  # 表头
  names = 'month outmoney inmoney actualmoney'.split()
  rows = [dict(zip(names, r)) for r in result]

  data = {}
  data['rows'] = rows
  res = {'code':10000,'message':'操作成功','success':True}
  res['data'] = data

  return jsonify(res)
