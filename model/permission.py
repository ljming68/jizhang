from sqlalchemy import Table
from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Permission(DBase):
  __table__ = Table('permission',md,autoload=True)

  def find_all(self):
    result = dbsession.query(Permission).filter_by().all()
    return result    
  
  # 根据pid 找
  def find_by_pid(self,pid):
    result = dbsession.query(Permission).filter_by(pid=pid).all()
    return result
  
  # 获取总数
  def get_permission_count(self):
    result = dbsession.query(Permission).filter_by().count()
    return result

  # 插入权限
  def insert_permission(self,name,code,description):
    permission = Permission(name=name,code=code,description=description)
    dbsession.add(permission)
    dbsession.commit()
    return permission

  # 删除权限
  def del_permission_by_pid(self,pid):
    result = dbsession.query(Permission).filter_by(pid=pid).delete()
    dbsession.commit()
    return result
  
  # 更新权限
  def update_permission(self,pid,dicts):
    data = self.find_by_pid(pid)
    if data:
      {setattr(data[0], k, v) for k,v in dicts.items()}
    else:
      data = None
    dbsession.commit()
    return data
