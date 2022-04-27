from sqlalchemy import Table
from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Role(DBase):
  __table__ = Table('role',md,autoload=True)

  def find_all(self):
    result = dbsession.query(Role).filter_by().all()
    return result 
  
  # 根据roleid 找
  def find_by_roleid(self,roleid):
    result = dbsession.query(Role).filter_by(roleid=roleid).all()
    return result
  
  # 获取总数
  def get_role_count(self):
    result = dbsession.query(Role).filter_by().count()
    return result

  # 插入角色
  def insert_role(self,identity,description):
    role = Role(identity=identity,description=description)
    dbsession.add(role)
    dbsession.commit()
    return role

  # 删除角色
  def del_role_by_roleid(self,roleid):
    result = dbsession.query(Role).filter_by(roleid=roleid).delete()
    dbsession.commit()
    return result
  
  # 更新角色
  def update_role(self,roleid,dicts):
    data = self.find_by_roleid(roleid)
    if data:
      {setattr(data[0], k, v) for k,v in dicts.items()}
    else:
      data = None
    dbsession.commit()
    return data
