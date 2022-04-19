from flask import Blueprint,request,session,make_response,jsonify
from model.users import Users
import re, hashlib,copy,math,json
from common import utlis

admin = Blueprint('admin',__name__)

# 用户列表
@admin.route('/userlist')
def userlist():
    page = int(request.args.get('page'))
    size = int(request.args.get('size'))
    total = int(request.args.get('total'))
    # print(page,size,total)
    start = (page - 1)
    # # 未登录
    # if session.get('islogin') is None:
    #     res = {'code':10002,'message':'您还未登录','success':False}
    #     return jsonify(res)
    
    # 权限判断
    if session.get('roleid') == 2:
        res = {'code':10002,'message':'您没有权限','success':False}
        return jsonify(res)

    user = Users()
    # 管理员
    if session.get('roleid') == 1:
        roleid = 2
        result = user.find_user_by_roleid(start,size,roleid)
        total = math.ceil(user.get_user_total())
    else:
        # 超管
        result = user.find_user_all(start,size)
        # 总数
        total = math.ceil(user.get_all_total())

    # print(result,total)

    rows = utlis.model_to_list(result)
    data = {}
    data['rows'] = rows
    data['total'] = total

    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = data
 
    return jsonify(res)

# 根据userid 获取信息
@admin.route('/user/<int:userid>')
def userinfo(userid):
    
    res = {'code':10002,'message':'您没有权限','success':False}
    # 权限判断
    if session.get('roleid') == 2:
       
        return jsonify(res)
    
    user = Users()
    # 管理员
    if session.get('roleid') == 1:
        result = user.find_user_by_userid(userid)
        # print(result[0].roleid)
        if result[0].roleid == 2:
            pass
        else:
            return jsonify(res)
    # 超管
    else:
        result = user.find_user_by_userid(userid)

  
    row = utlis.model_to_list(result)

    
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = row
    return jsonify(res)
  
# 获取用户简单信息  不知道什么时候用
@admin.route('/user/simple')
def simple():
    
    res = {'code':10002,'message':'您没有权限','success':False}
    # 权限判断
    if session.get('roleid') == 2:
       
        return jsonify(res)
    
    user = Users()
    # 管理员
    if session.get('roleid') == 1:
        result = user.find_user_by_roleid(2) 
    # 超管
    else:
        result = user.find_user_all()

  
    row = utlis.model_to_list(result)

    
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = row
    return jsonify(res)

# 添加 用户 超管（独有）
@admin.route('/user',methods=['POST'])
def add_user():
    user = Users()
    username = request.form.get('username').strip()
    password = request.form.get('password').strip()

    res = {'code':10002,'message':'您没有权限','success':False}
    if session.get('roleid') == 1 or session.get('roleid') == 2:
        return jsonify(res)

    # 验证邮箱地址的正确性
    if not re.match('.+@.+\..+', username):
        res['message'] = '邮箱格式错误'
        return jsonify(res)
    
    # 验证密码的有效性
    elif len(password) < 6:
        res['message'] = '密码少于6位'
        return jsonify(res)
    
    # 验证用户是否已经注册
    elif len(user.find_by_username(username)) > 0:
        res['message'] = '用户已存在'
        return jsonify(res)

    else:
        # 实现注册功能
        password = hashlib.md5(password.encode()).hexdigest()
        result = user.do_register(username,password)

        res = {'code':10000,'message':'添加成功','success':True}
        return jsonify(res)

# 删除 用户 超管（独有）
@admin.route('/user/<int:userid>',methods=['DELETE'])
def del_user(userid):
    res = {'code':10002,'message':'您没有权限','success':False}
    if session.get('roleid') == 1 or session.get('roleid') == 2:
        
        return jsonify(res)

    user = Users()
    length = user.find_user_by_userid(userid)
    if len(length) < 1:
        res['message'] = '用户不存在'
        return jsonify(res)
    else:
        result = user.del_user_by_userid(userid)
        print(result)

    res = {'code':10000,'message':'删除成功','success':True}
    return jsonify(res)

# 修改 用户 管理通用
@admin.route('/user/<int:userid>',methods=['PUT'])
def update_user(userid):
    # formdata
    # username = request.form.get('username').strip()
    # password = request.form.get('password').strip()
    res = {'code':10000,'message':'更新成功','success':True}
    return jsonify(res)
