# import re
# string = '[1,2,3,4,20,50]'
# res = re.findall(r"\d+",string)
# print(res)
# roleid = 0
# lists = []
# for i in res:
#   # print(i)
#   dicts = {'roleid':roleid}
#   dicts['pid'] = int(i)
#   lists.append(dicts)

# import calendar
# result = calendar.monthrange(2022,4)
# print(result[1])


# 原始数据
rows = (('apollo', 'male', '164.jpeg'), ('apollo', 'male', ''))
# 表头
names = 'username gender pic'.split()
# URL公共部分
fs_url = 'http://www.baidu.com/'

# 新数据列表
L = []
for e in rows:
    L1 = list(e)
    pic = e[2]
    if pic == '':
        L1[2] = "%suser_pic/default.jpg" % (fs_url)
    else:
        L1[2] = "%suser_pic/small_%s" % (fs_url, pic)
    L.append(L1)
print(L)
# 用zip组合列表套字典
"""
[{'username': 'apollo', 'gender': 'male', 'pic': 'http://www.baidu.com/user_pic/small_164.jpeg'}, 
{'username': 'apollo', 'gender': 'male', 'pic': 'http://www.baidu.com/user_pic/default.jpg'}]
"""
data = [dict(zip(names, d)) for d in L]
print (data)

  