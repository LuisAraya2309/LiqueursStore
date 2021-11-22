from databaseConnection import *
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib

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
        
def sendEmail(destiny,message):
    msg = MIMEMultipart()         
    password = "bunbury123"
    msg['From'] = "tiendabunbury@gmail.com"
    msg['To'] = destiny
    msg['Subject'] = "Amonestación"
    msg.attach(MIMEText(message,'plain'))
    
    server = smtplib.SMTP('smtp.gmail.com: 587')
    server.starttls()
    
    server.login(msg['From'], password)
    server.sendmail(msg['From'], msg['To'], msg.as_string())
    server.quit()