from sqlalchemy import Table
from common.database import dbconnect
import time,random
from flask import session
from model.account import Account
dbsession, md, DBase = dbconnect()

class Record(DBase):
  __table__ = Table('records',md,autoload=True)

# result = dbsession.query(Record,Account).join(Account,Account.payid == Record.payid )\
#       .filter_by(userid=session.get('userid'))\
#       .order_by(Record.recordid.desc()).limit(count).offset(start).all()

# 记账 联合查询
  def find_record_by_userid(self,start,count):
    result = dbsession.query(Record)\
      .filter_by(userid =session.get('userid')).filter(Record.category != '内部转账')\
      .order_by(Record.recordid.desc()).limit(count).offset(start).all()
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

  # 删除记录 recordid
  def del_record_by_recordid(self,recordid):
    result = dbsession.query(Record).filter_by(userid=session.get('userid'),recordid=recordid).delete()
    dbsession.commit()
    return result
  
  # 删除记录 payid
  def del_record_by_payid(self,payid):
    result = dbsession.query(Record).filter_by(userid=session.get('userid'),payid=payid).delete()
    dbsession.commit()
    return result
  
  # 添加转账记录
  def insert_transrecord(self,payid,payid2,note,amount):
    now = time.strftime('%Y-%m-%d %H:%M:%S')
    record = Record(userid=session.get('userid'),category='内部转账', amount=-amount, recordtime=now,
                    type=0, note=note, payid=payid, createtime=now, updatetime=now)
    record2 = Record(userid=session.get('userid'),category='内部转账', amount=amount, recordtime=now,
                    type=1, note=note, payid=payid2, createtime=now, updatetime=now)
    dbsession.add(record)
    dbsession.add(record2)
    dbsession.commit()
  
  # 更新记录
  def update_record(self,recordid,dicts):
    data = self.find_record_by_recordid(recordid)
    if data[0]:
      {setattr(data[0], k, v) for k,v in dicts.items()}
    dbsession.commit()
    return data[0]