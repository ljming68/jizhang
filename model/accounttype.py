from sqlalchemy import Table

from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Accounttype(DBase):
  __table__ = Table('paytype',md,autoload=True)

  def find_all(self):
    result = dbsession.query(Accounttype).order_by(Accounttype.paytypeid).all()
    return result