def tuple_to_list(*w):
    lists = []
    for i in range(len(w)):
        ls = []
        for j in w[i]:
            j = list(j)
            ls.append(j)
        lists.append(ls)
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