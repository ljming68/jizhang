from sqlalchemy import Table,func
from common.database import dbconnect
import time,random
from flask import session
dbsession, md, DBase = dbconnect()

class Users(DBase):
    __table__ = Table('users',md,autoload=True)

# 登录模块

    # 查询用户名，可用于注册时判断用户名是否已注册，也可用于登录校验
    def find_by_username(self,username):
        result = dbsession.query(Users).filter_by(username=username).all()  
        return result
    
    # 实现注册，首次注册时用户只需要输入用户名和密码，所以只需要两个参数
    # 注册时，在模型类中为其他字段尽力生成一些可用的值，虽不全面，但可用
    # 通常用户注册时不建议填写太多资料，影响体验，可待用户后续逐步完善
    def do_register(self,username,password):
        now = time.strftime('%Y-%m-%d %H:%M:%S')
        left = 'JZ_'
        nickname =left + username.split('@')[0]  # 默认将邮箱账号前缀作为昵称
        avatar = str(random.randint(1, 15))  # 从15张头像图片中随机选择一张
        user = Users(username=username, password=password, roleid=2,
                    nickname=nickname, avatar=avatar + '.png', createtime=now, updatetime=now)
        dbsession.add(user)
        dbsession.commit()
        return user

# 用户管理模块
    # 获取所有用户总数
    def get_all_total(self):
        result = dbsession.query(Users).count()
        return result

    # 获取 普通用户总数
    def get_user_total(self):
        result = dbsession.query(Users).filter_by(roleid = 2).count()
        return result

    # 获取所有用户列表 
    def find_user_all(self,start,count):
        result = dbsession.query(Users).order_by(Users.userid).limit(count).offset(start).all()
        return result

    #获取普通用户列表 
    def find_user_by_roleid(self,start,count,roleid):
        result = dbsession.query(Users).filter_by(roleid = roleid).order_by(Users.userid).limit(count).offset(start).all()
        return result
    
    # 根据 userid 获取用户信息
    def find_user_by_userid(self,userid):
        result = dbsession.query(Users).filter_by(userid = userid).all()
        return result

    # 删除用户
    def del_user_by_userid(self,userid):
        result = dbsession.query(Users).filter_by(userid = userid).delete()
        dbsession.commit()
        return result

    # 更新用户角色
    def update_user_roleid(self,userid,roleid):
        user = self.find_user_by_userid(userid)
        user[0].roleid = roleid
        dbsession.commit()
    
    # 获取个人信息
    def get_userinfo(self):
        result = self.find_user_by_userid(userid=session.get('userid'))
        if result:
            res = dbsession.query(Users.username,Users.nickname,Users.avatar,Users.qq,func.date_format(Users.createtime, '%Y-%m-%d'))\
                .filter_by(userid=session.get('userid')).all()
            return res
    
    # 获取简单个人信息
    def get_simple_userinfo(self):
        result = self.find_user_by_userid(userid=session.get('userid'))
        if result:
            res = dbsession.query(Users.userid,Users.nickname,Users.avatar,Users.roleid)\
                .filter_by(userid=session.get('userid')).all()
            return res

    # 更新 个人信息
    def update_userinfo(self,dicts):
        data = self.find_user_by_userid(userid=session.get('userid'))
        if data:
            {setattr(data[0], k, v) for k,v in dicts.items()}
        else:
            data = None
        dbsession.commit()
        return data
    
    # 更新 密码
    def update_password(self,password):
        data = self.find_user_by_userid(userid=session.get('userid'))
        if data:
            data[0].password = password
        dbsession.commit()
        return data

    # 更新 密码 管理员
    def change_password(self,userid,password):
        data = self.find_user_by_userid(userid=userid)
        if data:
            data[0].password = password
        dbsession.commit()
        return data