from sqlalchemy import Table,func,extract,and_
from common.database import dbconnect
import time,random
from flask import session
from model.record import Record
dbsession, md, DBase = dbconnect()

class Count(DBase):
  __table__ = Table('count',md,autoload=True)
  # 折线图
  def find_data_by_month(self,start_day, end_day):
    if start_day == end_day:
      result = dbsession.query(func.date_format(Count.day, '%Y-%m-%d')\
      ,Count.inmoney,Count.outmoney)\
        .filter_by(userid =session.get('userid'),day=start_day)\
                          .group_by('day').all()
    else:
      result = dbsession.query(func.date_format(Count.day, '%Y-%m-%d')\
        ,Count.inmoney,Count.outmoney)\
          .filter_by(userid =session.get('userid'))\
          .filter(Count.day.between(start_day, end_day))\
                            .group_by('day').all()
    return result
  #  月份  对应 支出 收入
  def find_data_by_year(self,start_day, end_day):
    result = dbsession.query(extract('month', Count.day).label('month')\
      ,func.sum(Count.inmoney).label('inmoney'),func.sum(Count.outmoney).label('outmoney'))\
        .filter_by(userid =session.get('userid'))\
          .filter(Count.day.between(start_day, end_day))\
        .group_by('month').all()
    return result
  # 根据 day 找统计数据
  def find_count_by_day(self,day):
    result = dbsession.query(Count).filter_by(userid =session.get('userid'),day = day).first()
    return result
  # 根据 userid 找统计数据
  def find_count_by_userid(self):
    result = dbsession.query(Count).filter_by(userid =session.get('userid')).all()
    return result
  # 添加记录时  更新统计表
  def insert_money(self,amount,recordtime,inandouttype):
    res = self.find_count_by_day(recordtime)
    if res:
      if int(inandouttype) == 0:
        res.outmoney = float(res.outmoney) + float(amount)
        dbsession.commit()
      else:
        res.inmoney = float(res.inmoney) + float(amount)
        dbsession.commit()
    else:
      if int(inandouttype) == 0:
        count = Count(userid=session.get('userid'),day=recordtime,outmoney = amount,inmoney = 0 )
        dbsession.add(count)
        dbsession.commit()
      else:
        count = Count(userid=session.get('userid'),day=recordtime,inmoney = amount ,outmoney = 0)
        dbsession.add(count)
        dbsession.commit()
    return '1'


  def count_money(self,inandouttype):
    result = dbsession.query(Record.recordtime,\
      func.sum(Record.amount))\
        .filter_by(userid =session.get('userid'),type=inandouttype)\
        .filter(Record.category != '内部转账',)\
        .group_by('recordtime').all()
    return result
  # 更新 修改 count
  def update_all(self,lists):
    dbsession.bulk_update_mappings(Count, lists)
    dbsession.commit()
    return '1'

  # 账单列表 
  def count_bill(self,start_day, end_day):
    result = dbsession.query(extract('month', Count.day).label('month')\
      ,func.sum(Count.outmoney).label('outmoney'),func.sum(Count.inmoney).label('inmoney'),\
        func.sum(Count.outmoney + Count.inmoney).label('actualmoney'))\
        .filter_by(userid =session.get('userid'))\
          .filter(Count.day.between(start_day, end_day))\
        .group_by('month').all()
    return result
  

    


