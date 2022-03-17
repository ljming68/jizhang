from flask import Blueprint
from model.users import Users
index = Blueprint('index',__name__)

@index.route('/')
# index index_show 不可以写成index 
def index_show():
    user = Users()
    result = user.find_all()
    print(result)
    return result
