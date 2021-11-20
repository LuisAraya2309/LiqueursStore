#Libraries
from flask import Flask,render_template,request
from flask.templating import render_template_string
from requests.models import parse_url #Flask framework
from databaseConnection import *
from auxiliarFunctions import *
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
 
@app.route('/subSchedules',methods=['GET','POST'])
def showSchedules():
    subsidiary = request.form['subsidiary']
    dbConnection = connectToDatabase(country)
    optionSelect = ""
    
    
    try:
        with dbConnection.cursor() as cursor:
            query = 'EXEC sp_ViewSchedule ? , ?'
            cursor.execute(query,(subsidiary,0))
            queryResult = cursor.fetchall()
            schedulesDay = []
            for day in queryResult:
                optionSelect = ""
                hour = str(day[2]).split(':')
                hour = hour[0] +":"+ hour[1]
                optionSelect+=(hour + "am  -  ")
                hour = str(day[3]).split(':')
                hour = hour[0] +":"+ hour[1]
                optionSelect+=(hour+"pm.")
                schedulesDay.append(optionSelect)
            return render_template('schedules.html',**locals())
            
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
                combinations+=(str(result[6]) + ', ')
            combinations = combinations[:-2]+'.'
            price = int(simpleResult[1])
            agedType = str(simpleResult[2])
            years = str(simpleResult[3])
            origin = str(simpleResult[4])
            tempFile = open('temp.jpg','wb')
            tempFile.write(queryResult[0][5])
            tempFile.close()
            shutil.move('temp.jpg','./static/images/temp.jpg')
            nearestSubsidiares = subsidiariesNear(username,productName,country)
            nearestSub = nearestSubsidiares[0][1]
            distance = int(nearestSubsidiares[0][2])
            distance = str(distance/1000)[:-1]
            nearestSub+=(" a solamente " + str(distance))
            availablesSubs = "Disponible en: "
            for result in nearestSubsidiares:
                availablesSubs+=(str(result[0])+', ')
            availablesSubs = availablesSubs[:-2]+'.'
                
            
            #destiny =   str(os.path.realpath('temp.jpg')) 
            #return str(destiny)
            #os.startfile(destiny)
            
            return render_template('productQuery.html',**locals())
            
            

    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
    
    finally:
        dbConnection.close()
        
        
        
@app.route('/listEmployees',methods=['GET','POST'])
def listEmployees():
    subsidiary = request.form['subsidiaryEmployees']
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            querySubisidiary = 'EXEC sp_EmployeesPerSubsidiary ?,?'
            cursor.execute(querySubisidiary,(subsidiary,0))
            queryResult = cursor.fetchall()
            employees = []
            for result in queryResult:
                employees.append(str(result[0]))
            
            return render_template('listEmployees.html',**locals())    
            
    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'

    finally:
        dbConnection.close()


        
        

def createReportsBattery():
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            querySubisidiary = 'EXEC sp_subsidiaryXCountry ?'
            cursor.execute(querySubisidiary,(0))
            queryResult = cursor.fetchall()
            subsidiaryList = []
            for i in range(0,len(queryResult)):
                subsidiaryList.append(queryResult[i][0])
            
            for subsidiary in subsidiaryList:
                dbConnection = connectToDatabase(country)
                try:
                    with dbConnection.cursor() as cursor:
                        queryProductXSubisidiary = 'EXEC sp_productxSubsidiary ? ,?'
                        cursor.execute(queryProductXSubisidiary,(subsidiary,0))
                        queryResult = cursor.fetchall()
                        productXSubsidiaryList = []
                        for i in range(0,len(queryResult)):
                            productXSubsidiaryList.append(queryResult[i][0])
                        
                        for product in productXSubsidiaryList:
                            
                            dbConnection = connectToDatabase(country)
                            try:
                                with dbConnection.cursor() as cursor:
                                    salesXSubsidiaryXProduct = 'EXEC sp_salesXSubsidiaryXProduct ? , ? , ?'
                                    cursor.execute(salesXSubsidiaryXProduct,(product,subsidiary,0))
                                    queryResult = cursor.fetchall()
                                    salesXSubsidiaryXProductList = queryResult[0]
                                    
                            except Exception as e:
                                print(e)
                                return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
                            finally:
                                dbConnection.close()
                                    
                                    
                except Exception as e:
                    print(e)
                    return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
                
                finally:
                    dbConnection.close()
                
            
    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'

    finally:
        dbConnection.close()
        
            


#Run application
if __name__ == '__main__':
    app.run(host="0.0.0.0",port=4000,debug=True)