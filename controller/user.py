from flask import Blueprint,request,session,make_response
from model.users import Users
from common.makecode import ImageCode,EmailCode
import re


user = Blueprint('user',__name__)

@user.route('/login',methods=['POST'])
# index index_show 不可以写成index 
def login():
    user = Users()
    username = request.form.get('username').strip()
    password = request.form.get('password').strip()

    result = user.find_by_username(username)
    if len(result) == 1 and result[0].password ==password:
        session['islogin'] = 'true'
        session['userid'] = result[0].userid
        session['username'] = username
        session['nickname'] = result[0].nickname
        session['roleid'] = result[0].roleid
        return 'login-success'
    # print(result)
    # return '11'

@user.route('/vcode')
def vcode():
    code,bstring = ImageCode().get_code()
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
    try:
        EmailCode().send_email(email,code)
        # 将邮箱验证码保存在Session中
        session['ecode'] = code
        return 'send-success'
    except:
        return 'send-fail'
