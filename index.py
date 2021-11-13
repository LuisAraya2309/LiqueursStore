#Libraries
from flask import Flask,render_template,request
from requests.models import parse_url #Flask framework
import json
import requests
#App creation
app = Flask(__name__)


#Global variables
username =""
api = "http://localhost:3001/"
'''
newRequest = api+'users'
resp = requests.get(newRequest)
p = resp.json()
'''

@app.route('/',methods=['GET','POST'])
def initLogin():
    return render_template('login.html')


#Run application
if __name__ == '__main__':
    app.run(host="0.0.0.0",port=4000,debug=True)