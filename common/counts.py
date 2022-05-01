from flask import jsonify
from model.count import Count
from common import utlis

def update_count():
  count = Count()
  inandouttype = 0
  result = count.count_money(inandouttype)
  inandouttype = 1
  result2 = count.count_money(inandouttype)
  # print(result,result2)

  names = 'day outmoney'.split()
  rows1 = [dict(zip(names, r)) for r in result]

  names = 'day inmoney'.split()
  rows2 = [dict(zip(names, r)) for r in result2]

  # print(rows1,rows2)

  result3 = count.find_count_by_userid()
  result3 = utlis.model_to_list(result3)

  for i in range(len(result3)):
    result3[i]['inmoney'] = 0
    result3[i]['outmoney'] = 0

  print(result3)
  for i in range(len(result3)):
    for j in range(len(rows1)):
      if result3[i]['day'] == rows1[j]['day']:
        result3[i]['outmoney'] = rows1[j]['outmoney']
      # break

    for z in range(len(rows2)):
      if result3[i]['day'] == rows2[z]['day']:
        result3[i]['inmoney'] = rows2[z]['inmoney']
      # break
  # print(result3)
  


  # re1 = [{'day': '2022-04-25', 'outmoney': -100.0 ,'inmoney': 100.0, 'userid': 6 ,'countid':3}]
  count.update_all(result3)

  return True