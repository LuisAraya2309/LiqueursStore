from databaseConnection import *
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import random


def returnSubsidiaries(country):
    #Get subsidiaries
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            querySubisidiary = 'SELECT S.Title FROM dbo.Subsidiary AS S'
            cursor.execute(querySubisidiary)
            queryResult = cursor.fetchall()
            subsidiaries = []
            for subsidiary in queryResult:
                subsidiaries.append(subsidiary[0])
            return subsidiaries
    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'

    finally:
        dbConnection.close()



def subsAvailable(productName,country):
    
    subsidiaries = returnSubsidiaries(country)
    subsAvailableList = []
    for subsidiary in subsidiaries:
        dbConnection = connectToDatabase(country)
        try:
            with dbConnection.cursor() as cursor:
                query = 'EXEC sp_productInSubsidiary ? , ? , ?'
                cursor.execute(query,(subsidiary,productName,0))
                queryResult = cursor.fetchall()
                if queryResult[0][1] == 0:
                    subsAvailableList+=[subsidiary]

        except Exception as e:
            print(e)
            return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
        
        finally:
            dbConnection.close()
    return subsAvailableList






def subsidiariesNear(username,productName,country):
    
    dbConnection = connectToDatabase(country)
    try:
        with dbConnection.cursor() as cursor:
            query = 'EXEC sp_SubsidiaryAvailable ? , ? , ?'
            cursor.execute(query,(productName,username,0))
            queryResult = cursor.fetchall()
            return queryResult
            

    except Exception as e:
        print(e)
        return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
    
    finally:
        dbConnection.close()
        
def sendEmail(destiny,message,subject):
    msg = MIMEMultipart()         
    password = "bunbury123"
    msg['From'] = "tiendabunbury@gmail.com"
    msg['To'] = destiny
    msg['Subject'] = subject
    msg.attach(MIMEText(message,'plain'))
    
    server = smtplib.SMTP('smtp.gmail.com: 587')
    server.starttls()
    
    server.login(msg['From'], password)
    server.sendmail(msg['From'], msg['To'], msg.as_string())
    server.quit()
    
def testTransactions(country):
    
    for i in range(1,20):
        dbConnection = connectToDatabase(country)
        try:
            with dbConnection.cursor() as cursor:
                query = 'EXEC sp_buyProduct ?,?,?,?,?,?,?,?,?'
                
                if country == 'Argentina':
                    productDicc = {1:'Baileys',2:'JB',3:'Legui'}
                    product = productDicc[random.randint(1,3)]
                    cursor.execute(query,('Mendoza','carlos24','17','0.0','Roger Araya Leiton','Ninguna',product,'Efectivo',0))
                elif country == 'Costa Rica':
                    productDicc = {1:'Baileys',2:'Cortez' ,3:'Smirnoff Vodka'}
                    product = productDicc[random.randint(1,3)]
                    cursor.execute(query,('Cartago','jorge87','17','0.0','Raul Alvarez Genis','Ninguna',product,'Efectivo',0))
                else:
                    productDicc = {1:'Ron Parce',2:'Don Julio' ,3:'Cortez'}
                    product = productDicc[random.randint(1,3)]
                    cursor.execute(query,('Cali','SamuSa','17','0.0','Raul Alvarez Garcia','Ninguna',product,'Efectivo',0))
                

        except Exception as e:
            print(e)
            return str(e) + 'Exception error. <a href="/">Intente de nuevo.</a>'
        
        finally:
            dbConnection.close()
            
    print('Finished')
    
