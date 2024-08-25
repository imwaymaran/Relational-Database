import psycopg2

print("\n~~~~~ MY SALON ~~~~~\nWelcome to My Salon, how can I help you?\n")

def main_menu():
    while True:
        execute("SELECT service_id, name FROM services ORDER BY service_id")
        SERVICE_ID_SELECTED = input()
        curs.execute(f"SELECT name FROM services WHERE service_id=%s", (SERVICE_ID_SELECTED, ))
        SERVICE_SELECTED = curs.fetchone()
        if not SERVICE_SELECTED:
            print("\nI could not find that service. What would you like today?")
        else:
            return (SERVICE_ID_SELECTED, *SERVICE_SELECTED)
    
def execute(query):
    curs.execute(query)
    for line in curs.fetchall():
            print(*line)        

try:
    conn = psycopg2.connect("dbname=salon user=freecodecamp")
    with conn, conn.cursor() as curs:
        SERVICE_ID_SELECTED, SERVICE_SELECTED = main_menu()
        CUSTOMER_PHONE = input("\nWhat's your phone number?\n")
        curs.execute(f"SELECT name FROM customers WHERE phone = %s", (CUSTOMER_PHONE, ))
        CUSTOMER_NAME = curs.fetchone()
        if not CUSTOMER_NAME:
            CUSTOMER_NAME = input("\nI don't have a record for that phone number, what's your name?\n")
            curs.execute(f"INSERT INTO customers(phone, name) VALUES(%s, %s)", (CUSTOMER_PHONE, CUSTOMER_NAME, ))
        else:
            CUSTOMER_NAME, = CUSTOMER_NAME
        curs.execute(f"SELECT customer_id FROM customers WHERE name = %s", (CUSTOMER_NAME, ))
        CUSTOMER_ID = curs.fetchone()[0]  
        SERVICE_TIME= input(f"\nWhat time would you like your {SERVICE_SELECTED}, {CUSTOMER_NAME}?\n")
        curs.execute(f"INSERT INTO appointments(time, customer_id, service_id) VALUES(%s, %s, %s)", (SERVICE_TIME, CUSTOMER_ID, SERVICE_ID_SELECTED, ))        
        print(f"\nI have put you down for a {SERVICE_SELECTED} at {SERVICE_TIME}, {CUSTOMER_NAME}.")
except psycopg2.OperationalError as error:
    print(f'Database not connected successfully:\n{error}')