import mysql.connector
from mysql.connector import Error


def connect_to_mysql():
   try:
      connection = mysql.connector.connect(
            host='boring_archimedes',  
            user='root',       # MySQL username
            password='root',   # MySQL password
            database='devops'  # Optional: specify a default database
        )
      
      if connection.is_connected():
         db_info = connection.get_server_info()
         print(f"Connected to MySQL Server version {db_info}")
            
          # Create a cursor object to execute queries
         cursor = connection.cursor()
            
            # Example: Execute a simple query
         cursor.execute("SELECT DATABASE();")
         db_name = cursor.fetchone()
         print(f"You're connected to database: {db_name}")
            
         return connection
   except Error as e:
      print(f"Error while connecting to MySQL: {e}")
      return None


def main():
  "This is main function"
  print(f"System Health check")
  print(f"Hello from DOCKER !!! --->>>> ")

  db_connection = connect_to_mysql()

  if db_connection:
        db_connection.close()
        print("MySQL connection closed.")

if __name__ == "__main__":
    main()