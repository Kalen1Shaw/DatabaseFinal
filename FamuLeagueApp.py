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

#Add Player
def insertPlayer():
  fn = input("First Name: ")
  ln = input("Last Name: ")
  player_num = int(input("Number: "))
  username = input("Username: ")
  console = input("Console of choice(Enter Xbox, PS, or PC): ")
  gender = input("Gender (M - Male, F- Female, NS- Prefer not to say): ")
  dob = input("Date of Birth(): ")

  mycursor = mydb.cursor()

  sql = "INSERT INTO Players (FIRST_NAME, LAST_NAME, NUMBER, USERNAME, CONSOLE, GENDER, DOB) " \
                                   "VALUES(%s,%s,%s,%s,%s,%s,%s)"
  
  arg = (fn, ln, player_num, username, console, gender, dob)

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



#Update Team Info

# def updateTeam():



#Count Sum Of Kills Based off Team
# def sumofKillsperTeam():
#   team = input()



#Show Player with Least amount of Deaths based off Team

# def leastDeathsperTeam();



mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="finaldb"
)

option = 0;

while option != 8: 
    
    print("")
    print("1. Add a player")
    print("2. Find a player by id")
    print("3. Delete a player")
    print("4. Show all players")
    print("5. Update Team Info")
    print("6. Find Total Kills for Each Team: ")
    print("7. Find Player with the least amount of Deaths: ")
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
    
