import mysql.connector

# Execute:
# python3 musicapp.py
#

#Show All Players
def showall():
  
  mycursor = mydb.cursor()

  mycursor.execute("SELECT * FROM Players")

  myresult = mycursor.fetchall()

  for x in myresult:
    print(x)
    
  return;

#Find Players By ID
def findbyid():
    
    id = int(input("Enter Id: "))

    mycursor = mydb.cursor()

    sql = "SELECT * FROM Players WHERE PLAYER_ID = %s"
    arg = (id, )

    mycursor.execute(sql, arg)

    myresult = mycursor.fetchall()

    for x in myresult:
       print(x)
    
    return;

#Add New Mode
def insertPlayer():
  mode = input("Name of the Mode: ")
  descr = input("Describe the Mode: ")

  mycursor = mydb.cursor()

  sql = "INSERT INTO Mode (MODE_NAME, DESCRIPT) " \
                                   "VALUES(%s,%s)"
  
  arg = (mode, descr)

  mycursor.execute(sql, arg)

  mydb.commit()

#Delete Player
def deletebyid():

    Num = int(input("Enter ID number you would like to delete: "))
    mycursor = mydb.cursor()

    sql = "DELETE FROM Players WHERE PLAYER_ID = %s"

    arg = (Num,)

    mycursor.execute(sql, arg)
    
    mydb.commit()



#Update Match Score
def updateMatch():

  id = int(input("What is the Match ID you're trying to update? "))
  sco = input("What is the new score? ")
  mycursor = mydb.cursor()

  sql = "UPDATE Matches SET SCORE = %s WHERE MATCH_ID = %s"

  arg =(sco, id)

  mycursor.execute(sql, arg)

  mydb.commit()



#Count Sum Of Kills Based off Team
def sumofKillsperTeam():
  team = input("Which team do you want to calculate?(Bears, Rattlers, Tigers, or Wildcats): ")
   
  mycursor = mydb.cursor()
   
  sql = " select SUM(KILLS) FROM Player_Stats WHERE PLAYER_ID IN (SELECT PLAYER_ID FROM Players WHERE PLAYER_ID IN (SELECT PLAYER_ID FROM Player_Team WHERE TEAM_ID IN (SELECT TEAM_ID FROM Teams WHERE TEAM_NAME = %s)))"
  arg = (team, )

  mycursor.execute(sql, arg)

  myresult = mycursor.fetchall()
   
  for x in myresult:
    print(x)
    
  return;




#Show Player with Least amount of Deaths based off Team

# def leastDeathsperTeam():
  



mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="finaldb"
)

option = 0;

while option != 8: 
    
    print("")
    print("1. Add new game mode")
    print("2. Find a player by id")
    print("3. Delete a player")
    print("4. Show all players")
    print("5. Update Match Score")
    print("6. Find Total  Kills for each Team.")
    print("7. Find Player with the least amount of Deaths")
    print("8. Exit")
    
    option = int(input("Choice: "))
    print (option)
    if option == 4:
        showall()
    elif option == 2:
        findbyid()
    elif option == 3:
        deletebyid()
    elif option == 1:
        insertPlayer()
    elif option == 6:
        sumofKillsperTeam()
    elif option == 5:
        updateMatch()
