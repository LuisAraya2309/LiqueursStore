from databaseConnection import *

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
        
    