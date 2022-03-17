from sqlalchemy import Table
from common.database import dbconnect

dbsession, md, DBase = dbconnect()

class Users(DBase):
    __table__ = Table('users',md,autoload=True)

    # 查询用户
    def find_by_username(self,username):
        result = dbsession.query(Users).filter_by(username=username).all()  
        return result