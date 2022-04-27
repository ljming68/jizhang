from sqlalchemy import Table
from common.database import dbconnect
import time,random
from flask import session
from model.role import Role
dbsession, md, DBase = dbconnect()

class Roleperm(DBase):
  __table__ = Table('rolepermission',md,autoload=True)

  # 查找角色权限 roleid
  def find_roleperm_by_roleid(self,roleid):
    result = dbsession.query(Roleperm.pid)\
      .filter_by(roleid=roleid).all()
    return result

  # 查找角色权限 pid
  def find_roleperm_by_pid(self,pid):
    result = dbsession.query(Roleperm.pid)\
      .filter_by(pid=pid).all()
    return result 
  
  # 插入角色权限
  def insert_roleperm(self,roleid,):
    role = Role(identity=identity,description=description)
    dbsession.add(role)
    dbsession.commit()
    return role

  # 删除角色权限 roleid
  def del_roleperm_by_roleid(self,roleid):
    result = dbsession.query(Roleperm).filter_by(roleid=roleid).delete()
    dbsession.commit()
    return result

  # 删除角色权限 pid
  def del_roleperm_by_pid(self,pid):
    result = dbsession.query(Roleperm).filter_by(pid=pid).delete()
    dbsession.commit()
    return result

  # 更新角色权限
  def update_roleperm(self,roleid,lists):
    data = self.find_roleperm_by_roleid(roleid)
    if data:
      self.del_roleperm_by_roleid(roleid)

      dbsession.bulk_insert_mappings(Roleperm, lists)

      dbsession.commit()
    
    return True