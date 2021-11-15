#Libraries
from flask import Flask,render_template,request
from requests.models import parse_url #Flask framework
from databaseConnection import *
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

#Routes
@app.route('/',methods=['GET'])   #Login page
def login():
    return render_template('login.html')

@app.route('/signIn',methods=['GET','POST'])  #Sign in
def validateUser():
    user = request.form['user']
    password = request.form['password']
    dbConnection = connectToDatabase()
    try:
        with dbConnection.cursor() as cursor:
            query = 'EXEC sp_SignIn ? , ? , ?'
            cursor.execute(query,(user,password,0))
            queryResult = cursor.fetchall()
            validUser = queryResult[0][0]
            userType = queryResult[0][1]

            if validUser != 1:
                global username
                username = user
                if userType == 1:
                    return "Hola"
            else:
                return render_template('login.html') + '''<div class="window-notice" id="window-notice" >
                                <div class="content">
                                    <div class="content-text">Usuario o contraseña inválido. Vuelva a intentarlo.
                                    <a href="/beginSignUp">Registrarse</a></div>
                                    <div class="content-buttons"><a href="#" id="close-button">Aceptar</a></div>
                                </div>
                            </div>
                            <script>
                                        let close_button = document.getElementById('close-button');
                                            close_button.addEventListener("click", function(e) {
                                            e.preventDefault();
                                            document.getElementById("window-notice").style.display = "none";
                                            window.location.href="/";
                                        });
                            </script>
                            '''

    except Exception as e:
        print(e)
        return str(e) + 'Exception error aquiiiiiiii. <a href="/">Intente de nuevo.</a>'
    
    finally:
        dbConnection.close()
#Run application
if __name__ == '__main__':
    app.run(host="0.0.0.0",port=4000,debug=True)