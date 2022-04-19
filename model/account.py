from sqlalchemy import Table

from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Account(DBase):
  __table__ = Table('pay',md,autoload=True)


  def find_all(self):
    result = dbsession.query(Account).filter_by(userid = session.get('userid')).all()
    return result

  # 根据userid 找用户名下所有账户 
  def find_account_by_userid(self,start,count):
    result = dbsession.query(Account).filter_by(userid=session.get('userid'))\
      .order_by(Account.payid.asc()).limit(count).offset(start).all()
    return result

  # 获取账户总数
  def get_account_count(self):
    result = dbsession.query(Account).filter_by(userid=session.get('userid')).count()
    return result



  # 根据 payid 找 记录
  def find_by_payid(self,payid):
    result = dbsession.query(Account).filter_by(userid=session.get('userid'),payid=payid).first()
    return result
  
  # 更新余额
  def update_balance(self,payid,amount):
    pay = self.find_by_payid(payid)
    pay.balance = float(pay.balance) + float(amount)
    dbsession.commit()

  # 插入账户
  def insert_account(self,payname,balance,paytypeid):
    now = time.strftime('%Y-%m-%d %H:%M:%S')
    account = Account(userid=session.get('userid'),payname=payname,balance=balance,paytypeid=paytypeid, 
                    createtime=now, updatetime=now)
    dbsession.add(account)
    dbsession.commit()
    return account
  
  # 删除账户
  def del_account_by_payid(self,payid):
    result = dbsession.query(Account).filter_by(userid=session.get('userid'),payid=payid).delete()
    dbsession.commit()
    return result

