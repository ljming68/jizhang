from flask import Blueprint,request,session,make_response
from model.users import Users
from common.makecode import ImageCode,EmailCode
import re, hashlib


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
    # print(code)
    try:
        EmailCode().send_email(email,code)
        # 将邮箱验证码保存在Session中
        session['ecode'] = code
        return 'send-success'
    except:
        return 'send-fail'

@user.route('/login',methods=['POST'])
# index index_show 不可以写成index 
def login():
    user = Users()
    username = request.form.get('username').strip()
    password = request.form.get('password').strip()
    vcode = request.form.get('vcode').lower().strip()

    # 校验图形验证码是否正确 
    # ！！！0000 在正式上线时要删掉
    if vcode != session.get('vcode') and vcode != '0000':
        return 'vcode-error'
    
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
            return 'login-success'
        

@user.route('/register',methods=['POST'])
def register():
    user = Users()
    username = request.form.get('username').strip()
    password = request.form.get('password').strip()
    ecode = request.form.get('ecode').strip()

    # 校验邮箱验证码是否正确
    if ecode != session.get('ecode'):
        return 'ecode-error'
    
    # 验证邮箱地址的正确性
    elif not re.match('.+@.+\..+', username):
        return 'email-invalid'
    
    # 验证密码的有效性
    elif len(password) < 5:
        return 'password-invalid'
    
    # 验证用户是否已经注册
    elif len(user.find_by_username(username)) > 0:
        return 'user-repeated'
    
    else:
        # 实现注册功能
        password = hashlib.md5(password.encode()).hexdigest()
        result = user.do_register(username,password)
        session['islogin'] = 'true'
        session['userid'] = result.userid
        session['username'] = username
        session['nickname'] = result.nickname
        session['roleid'] = result.roleid
        return 'register-success'
