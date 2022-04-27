def tuple_to_list(result):
    lists = []
    for i in range(len(result)):
        # ls = []
        for j in result[i]:
            # print(j)
            # j = list(j)
            # ls.append(j)
          lists.append(j)
    return lists

def model_to_list(result):
  lists = []
  for row in result:
    dicts = {}
    for k,v in row.__dict__.items():
      if not k.startswith('_sa_instance_state'):
        # 如果某个字段的值是datetime类型，则将其格式为字符串
        # if isinstance(v, datetime):
        #   v = v.strftime('%Y-%m-%d %H:%M:%S')
        dicts[k] = v
    lists.append(dicts)
  return lists

# SQLAlchemy连接查询两张表的结果集转换为[{},{}]
# Comment，Users， [(Comment, Users),(Comment, Users),(Comment, Users)]
def model_join_list(result):
  list = []  # 定义列表用于存放所有行
  for obj1, obj2 in result:
    dict = {}
    for k1, v1 in obj1.__dict__.items():
      if not k1.startswith('_sa_instance_state'):
        if not k1 in dict:  # 如果字典中已经存在相同的Key则跳过
          dict[k1] = v1
    for k2, v2 in obj2.__dict__.items():
      if not k2.startswith('_sa_instance_state'):
        if not k2 in dict:  # 如果字典中已经存在相同的Key则跳过
          dict[k2] = v2
    list.append(dict)
  return list

def one_to_list(result):
  lists = []
  dicts = {}
  for k,v in result.__dict__.items():
    if not k.startswith('_sa_instance_state'):
      # 如果某个字段的值是datetime类型，则将其格式为字符串
      # if isinstance(v, datetime):
      #   v = v.strftime('%Y-%m-%d %H:%M:%S')
      dicts[k] = v
  lists.append(dicts)
  return lists