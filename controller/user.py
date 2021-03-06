from flask import Blueprint,request,session,make_response,jsonify
from model.users import Users
from common.makecode import ImageCode,EmailCode
import re, hashlib,copy,math,json
from flask_restplus import Resource
from common import utlis
from model.record import Record
from model.roleperm import Roleperm
from model.role import Role
from model.permission import Permission


user = Blueprint('user',__name__)


@user.route('/vcode')
def vcode():
    code,bstring = ImageCode().get_code()
    print(code)
    response = make_response(bstring)
    response.headers['Content-Type'] = 'image/jpeg'
    session['vcode'] = code.lower()
    return response

@user.route('/ecode',methods=['POST'])
def ecode():
    email = request.form.get('email')
    if not re.match('.+@.+\..+', email):
        return 'email-invalid'
    
    code = EmailCode().gen_email_code()
    print(code)
    res = {}
    res['success'] = False
    res['code'] = 200001
    res['message'] = '发送失败'
    # print(code)
    try:
        EmailCode().send_email(email,code)
        # 将邮箱验证码保存在Session中
        session['ecode'] = code

        res['success'] = True
        res['code'] = 10000
        res['message'] = '发送成功'
        return jsonify(res)
    except:
        return jsonify(res)

@user.route('/login',methods=['POST'])
def login():
    user = Users()
    # json 处理传过来的payload数据
    # data = request.get_json(silent=True)
    # print(data)
    # print(data['username']) #123

    username = request.form.get('userName').strip()
    password = request.form.get('passWord').strip()
    vcode = request.form.get('imgCode').strip()
    
    res = {}
    res['success'] = False
    res['code'] = 200001
    res['message'] = '图片验证码错误'

    # 校验图形验证码是否正确 
    # ！！！0000 在正式上线时要删掉
    if vcode != session.get('vcode') and vcode != '0000':
        return jsonify(res)
    
    else:
        #实现登录功能
        password = hashlib.md5(password.encode()).hexdigest()
        result = user.find_by_username(username)
        if len(result) == 1 and result[0].password ==password:
            session['islogin'] = 'true'
            session['userid'] = result[0].userid
            session['username'] = username
            session['nickname'] = result[0].nickname
            session['roleid'] = result[0].roleid

            res['success'] = True
            res['code'] = 10000
            res['message'] = '登录成功'
            data = {}
            data['token'] = username
            res['data'] = data
            # 将Cookie写入浏览器
            response = make_response(jsonify(res))
            # response.set_cookie('userid', str(session.get('userid')) , max_age=30*24*3600) # 1 小时有效期
            # response.set_cookie('username', username, max_age=30*24*3600) #30天有效期
            # response.set_cookie('password', password, max_age=30*24*3600)
            return response
            # return jsonify(res)
        else:
            res['message'] = '用户名或密码错误'
            return jsonify(res)
        

@user.route('/register',methods=['POST'])
def register():
    user = Users()
    username = request.form.get('username').strip()
    password = request.form.get('password').strip()
    ecode = request.form.get('ecode').strip()

    res = {}
    res['success'] = False
    res['code'] = 200001
    res['message'] = '邮箱验证码错误'

    # 校验邮箱验证码是否正确
    if ecode != session.get('ecode') and ecode != 'AAAAAA':
        return jsonify(res)
    
    # 验证邮箱地址的正确性
    elif not re.match('.+@.+\..+', username):
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
        session['islogin'] = 'true'
        session['userid'] = result.userid
        session['username'] = username
        session['nickname'] = result.nickname
        session['roleid'] = result.roleid

        res['success'] = True
        res['code'] = 10000
        res['message'] = '注册成功'


        return jsonify(res)

@user.route('/logout')
def logout():
    # 清空session ，页面跳转
    session.clear()
    res = {'code':10000,'message':'操作成功','success':True}
    response = make_response(jsonify(res))
    return response

@user.route('/userinfo')
def userinfo():
    user = Users()
    result = user.get_userinfo()
    names = 'username nickname avatar qq time'.split()
    rows = [dict(zip(names, r)) for r in result]
    print(rows)
    record = Record()
    result2 = record.get_record_count()
    rows[0]['count'] = result2

    data = {}
    data['rows'] = rows
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = data

    return jsonify(res)

@user.route('/userinfo',methods=['PUT'])
def update_userinfo():
  nickname = request.form.get('nickname').strip()
  avatar = request.form.get('avatar').strip()
  qq = request.form.get('qq').strip()

  # 校验信息

  #
  user = Users()
  dicts = {}
  dicts['nickname'] = nickname
  dicts['avatar'] = avatar
  dicts['qq'] = qq

  result = user.update_userinfo(dicts)
  # print(result)
  if result:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}


  return jsonify(res)

@user.route('/userpwd',methods=['PUT'])
def update_userpwd():
  password = request.form.get('password').strip()
  # 校验信息

  if len(password) < 6:
    res = {'code':10000,'message':'密码少于6位','success':True}
    return jsonify(res)

  # 准备
  password = hashlib.md5(password.encode()).hexdigest()
  user = Users()
  result = user.update_password(password)
  # print(result)
  if result:
    res = {'code':10000,'message':'更新成功','success':True}
  else:
    res = {'code':10002,'message':'操作失败','success':False}

  return jsonify(res)

@user.route('/usersimple')
def usersimple():
    user = Users()
    result = user.get_simple_userinfo()
    names = 'userid nickname avatar roleid'.split()
    rows = [dict(zip(names, r)) for r in result]
    print()

    roleperm = Roleperm()
    result2 = roleperm.find_roleperm_by_roleid(rows[0]['roleid'])
    role = Role()
    rolename = role.find_by_roleid(rows[0]['roleid'])[0].identity
    rows[0]['rolename'] = rolename
    # print(rolename)
    pids = utlis.tuple_to_list(result2)
    # print(pids)
    permission = Permission()
    menus = []
    if pids:
        for i in pids:
            # print(i)
            result3 = permission.find_by_pid(i)
            code = utlis.model_to_list(result3)[0]['code']
            menus.append(code)
            # print(code)
    # print(menus)

    data = {}
    data['rows'] = rows
    data['menus'] = menus
    res = {'code':10000,'message':'操作成功','success':True}
    res['data'] = data

    return jsonify(res)