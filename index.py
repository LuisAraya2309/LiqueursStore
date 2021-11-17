#Libraries
from flask import Flask,render_template,request
from flask.templating import render_template_string
from requests.models import parse_url #Flask framework
from databaseConnection import *
import json ,requests, os
import shutil
#App creation
app = Flask(__name__)


#Global variables
username =""
api = "http://localhost:3001/"
imageSrc = ""
country="Costa Rica"
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
    
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            query = 'EXEC sp_SignIn ? , ? , ?'
            cursor.execute(query,(user,password,0))
            queryResult = cursor.fetchall()
            interfaces = {'Consultant':'consultant.html'}
            validUser = queryResult[0][0]
            userType = queryResult[0][1]

            if validUser != 1:
                global username
                username = user
                return render_template(interfaces[userType])
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
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
    
    finally:
        dbConnection.close()
 
 
        
@app.route('/queryProduct',methods=['GET','POST'])
def queryProduct():
    productName = request.form['productName']
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            query = 'EXEC sp_ViewProduct ? , ?'
            cursor.execute(query,(productName,0))
            queryResult = cursor.fetchall()
            simpleResult = queryResult[0]
            combinations = "Combinaciones sugeridas: "
            for result in queryResult:
                combinations+=(str(result[6]) + ',')
            combinations = combinations[:-1]+'.'
            price = int(simpleResult[1])
            agedType = str(simpleResult[2])
            years = str(simpleResult[3])
            origin = str(simpleResult[4])
            tempFile = open('temp.jpg','wb')
            tempFile.write(queryResult[0][5])
            tempFile.close()
            shutil.move('temp.jpg','./static/images/temp.jpg')
            #destiny =   str(os.path.realpath('temp.jpg')) 
            #return str(destiny)
            #os.startfile(destiny)
            return render_template('productQuery.html',**locals())
            
            

    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
    
    finally:
        dbConnection.close()
        



#Run application
if __name__ == '__main__':
    app.run(host="0.0.0.0",port=4000,debug=True)