from sqlalchemy import Table
from common.database import dbconnect
import time,random
from flask import session

dbsession, md, DBase = dbconnect()

class Record(DBase):
  __table__ = Table('records',md,autoload=True)

# 记账
  def find_record_by_userid(self,start,count):
    result = dbsession.query(Record).filter_by(userid=session.get('userid'))\
      .order_by(Account.payid.asc()).limit(count).offset(start).all()
    return result
  
  # 获取记录总数
  def get_record_count(self):
    result = dbsession.query(Record).filter_by(userid=session.get('userid')).count()
    return result

  # 根据recordid 找记录
  def find_record_by_recordid(self,recordid):
    result = dbsession.query(Record).filter_by(userid=session.get('userid'),recordid=recordid).all()
    return result


  # 插入记录
  def insert_record(self,category,amount,recordtime,inandouttype,note,payid):
    now = time.strftime('%Y-%m-%d %H:%M:%S')
    record = Record(userid=session.get('userid'),category=category, amount=amount, recordtime=recordtime,
                    type=inandouttype, note=note, payid=payid, createtime=now, updatetime=now)
    dbsession.add(record)
    dbsession.commit()
    return record

  # 删除记录
  def del_record_by_recordid(self,recordid):
    result = dbsession.query(Record).filter_by(userid=session.get('userid'),recordid=recordid).delete()
    dbsession.commit()
    return result