import psycopg2

def execute(query):
    curs.execute(query)
    for line in curs.fetchall():
            print(*line)

try:
    conn = psycopg2.connect("dbname=worldcup user=freecodecamp")
    with conn, conn.cursor() as curs:
        print("Total number of goals in all games from winning teams:")
        execute("SELECT SUM(winner_goals) FROM games")
        
        print("\nTotal number of goals in all games from both teams combined:")
        execute("SELECT SUM(winner_goals + opponent_goals) FROM games")
        
        print("\nAverage number of goals in all games from the winning teams:")
        execute("SELECT AVG(winner_goals) FROM games")

        print("\nAverage number of goals in all games from the winning teams rounded to two decimal places:")
        execute("SELECT ROUND(AVG(winner_goals), 2) FROM games")

        print("\nAverage number of goals in all games from both teams:")
        execute("SELECT AVG(winner_goals + opponent_goals) FROM games")
        
        print("\nMost goals scored in a single game by one team:")
        execute("SELECT MAX(winner_goals) FROM games")
        
        print("\nNumber of games where the winning team scored more than two goals:")
        execute("SELECT COUNT(*) FROM games WHERE winner_goals > 2")
        
        print("\nWinner of the 2018 tournament team name:")
        execute("SELECT name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE round = 'Final' and year = 2018")
        
        print("\nList of teams who played in the 2014 'Eighth-Final' round:")
        execute("SELECT name FROM teams JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE round = 'Eighth-Final' and year = 2014 ORDER BY name")
        
        print("\nList of unique winning team names in the whole data set:")
        execute("SELECT DISTINCT(name) FROM teams JOIN games ON teams.team_id = games.winner_id ORDER BY name")
        
        print("\nYear and team name of all the champions:")
        execute("SELECT year, name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE round = 'Final' ORDER BY year")
        
        print("\nList of teams that start with 'Co':")
        execute("SELECT name FROM teams WHERE name LIKE 'Co%'")
except psycopg2.OperationalError as error:
    print(f'Database not connected successfully:\n{error}')