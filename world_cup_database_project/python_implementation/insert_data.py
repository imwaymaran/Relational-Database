import subprocess
import psycopg2

bashCommand = "find ~/Desktop -name games.csv"
file_location = subprocess.check_output(bashCommand, shell=True).decode('ascii').strip()
try:
    conn = psycopg2.connect("dbname=worldcup user=freecodecamp")
    with conn:
        with open(file_location, 'r') as file, conn.cursor() as curs:
            curs.execute("TRUNCATE teams, games;")
            for line in file:
                year,round,winner,opponent,winner_goals,opponent_goals = line.split(',')
                if (year != 'year'):
                    curs.execute(f"SELECT team_id FROM teams WHERE name = %s", (winner, ))
                    winner_id = curs.fetchall()
                    if not winner_id:
                        curs.execute("INSERT INTO teams(name) VALUES(%s)", (winner, ))
                        curs.execute(f"SELECT team_id FROM teams WHERE name = %s", (winner, ))
                        winner_id = curs.fetchall()[0]
                    curs.execute(f"SELECT team_id FROM teams WHERE name = %s", (opponent, ))
                    opponent_id = curs.fetchall()
                    if not opponent_id:
                        curs.execute("INSERT INTO teams(name) VALUES(%s)", (opponent, ))
                        curs.execute(f"SELECT team_id FROM teams WHERE name = %s", (opponent, ))
                        opponent_id = curs.fetchall()[0]
                    curs.execute('''INSERT INTO games(
                                                    year,
                                                    round,
                                                    winner_id,
                                                    opponent_id,
                                                    winner_goals,
                                                    opponent_goals
                                                    ) 
                                                VALUES(%s, %s, %s, %s, %s, %s)''', (year, round, *winner_id, *opponent_id, winner_goals, opponent_goals, ))    
                    #print(year,round,winner,opponent,winner_goals,opponent_goals)  
    conn.close()
    print('Database connected successfully')                    
except psycopg2.OperationalError as error:
    print(f'Database not connected successfully:\n{error}')