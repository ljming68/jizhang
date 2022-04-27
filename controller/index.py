from flask import Blueprint,session,jsonify,request
from model.count import Count
import calendar,math
from common import utlis

index = Blueprint('index',__name__)

@index.route('/datelist',methods=['POST'])
def datelist():
  date = request.form.get('date').strip()
  result = date.split('-')
  # year = result[0]
  # month = result[1]
  # 获取月份 有多少天
  result = calendar.monthrange(int(result[0]),int(result[1]))
  # count = Count()
  # result = count()
  days = result[1]
  start_day = date + '-' + '1'
  end_day = date + '-' + str(days)
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