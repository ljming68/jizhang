from flask import Flask

from flask_sqlalchemy import SQLAlchemy
import pymysql
pymysql.install_as_MySQLdb() # ModuleNotFoundError: No module named 'MySQLdb'

import os


app = Flask(__name__,static_url_path='/',static_folder='static')
app.config['SECRET_KEY'] = os.urandom(24)

# 使用集成方式处理SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:lv1234@localhost:3306/jizhangmanage?charset=utf8'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # True: 跟踪数据库的修改，及时发送信号
app.config['SQLALCHEMY_POOL_SIZE'] = 100  # 数据库连接池的大小。默认是数据库引擎的默认值（通常是 5）
# 实例化db对象
db = SQLAlchemy(app)

if __name__ == "__main__":
    
    from controller.index import *
    app.register_blueprint(index)

    from controller.user import *
    app.register_blueprint(user)
    app.run(debug=True)