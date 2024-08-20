import psycopg2

try:
    conn = psycopg2.connect("dbname=worldcup user=waymaran")
    with conn:
        with conn.cursor() as curs:
            curs.execute('''CREATE TABLE teams(
											team_id SERIAL PRIMARY KEY, 
											name VARCHAR(30) NOT NULL UNIQUE
											);
						''')
            curs.execute('''CREATE TABLE games(
											game_id SERIAL PRIMARY KEY,
											year INT NOT NULL,
											round VARCHAR(30) NOT NULL,
											winner_id INT NOT NULL REFERENCES teams(team_id),
											opponent_id  INT NOT NULL REFERENCES teams(team_id),
											winner_goals INT NOT NULL,
											opponent_goals INT NOT NULL
											);
						''')
            conn.commit()
    conn.close()
    print("Database connected successfully")
except psycopg2.OperationalError as error:
    print(f'Database not connected successfully:\n{error}')