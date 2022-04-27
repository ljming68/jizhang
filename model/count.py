from sqlalchemy import Table,func
from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Count(DBase):
  __table__ = Table('count',md,autoload=True)

  def find_data_by_month(self,start_day, end_day):
    result = dbsession.query(func.date_format(Count.day, '%Y-%m-%d')\
      ,Count.inmoney,Count.outmoney)\
        .filter(Count.day.between(start_day, end_day))\
                          .group_by('day').all()
    return result

