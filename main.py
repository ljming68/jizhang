from flask import Flask,session

from flask_sqlalchemy import SQLAlchemy
import pymysql
pymysql.install_as_MySQLdb() # ModuleNotFoundError: No module named 'MySQLdb'

import os
# from flask_cors import CORS
import flask.scaffold
flask.helpers._endpoint_from_view_func = flask.scaffold._endpoint_from_view_func
from flask_restplus import Api,Resource



app = Flask(__name__,static_url_path='/',static_folder='static')
app.config['SECRET_KEY'] = os.urandom(24)
api = Api(app)

# 使用集成方式处理SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:lv1234@localhost:3306/jizhangmanage?charset=utf8'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # True: 跟踪数据库的修改，及时发送信号
app.config['SQLALCHEMY_POOL_SIZE'] = 100  # 数据库连接池的大小。默认是数据库引擎的默认值（通常是 5）
# 实例化db对象
db = SQLAlchemy(app)

# 定义全局拦截器
@app.before_request
def before():
    url = request.path
    pass_list = ['/login','/register','/logout','/vcode','/ecode']
    if url in pass_list :
        pass
    # elif session.get('islogin') is None:
    #     res = {'code':10002,'message':'您还未登录','success':False}
    #     return jsonify(res)




if __name__ == "__main__":
    
    from controller.index import *
    app.register_blueprint(index)

    from controller.user import *
    app.register_blueprint(user)

    from controller.admins import *
    app.register_blueprint(admins)

    from controller.jizhang import *
    app.register_blueprint(jizhang)

    from controller.pay import *
    app.register_blueprint(pay)

    from controller.permission import *
    app.register_blueprint(permission)
    
    from controller.role import *
    app.register_blueprint(role)

    from controller.roleperm import *
    app.register_blueprint(roleperm)

    app.run(debug=True)