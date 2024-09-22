#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=guessing_game -t --no-align -c"

MAIN() {
  echo -e "\nEnter your username:"
  read USERNAME
  USERNAME_LENGTH=${#USERNAME}
  if [[ -z $USERNAME ]] || [[ ! $USERNAME_LENGTH -le 22 ]]
  then
    echo -e "\nUnfortunatly, the character limit for username is from 1 to 22. \nPlease, try again."  
    MAIN
  else
    USERNAME_DB=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")  
    if [[ -z $USERNAME_DB ]]
    then 
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
      INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    else
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
      GAMES_PLAYED=$($PSQL "SELECT count(*) FROM games WHERE user_id=$USER_ID")
      BEST_GAME=$($PSQL "SELECT max(number_of_guesses) FROM games WHERE user_id=$USER_ID")
      echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
    fi  
    RANDINT=$((1 + $RANDOM % 1000))
    NUMBER_OF_GUESSES=0
    GAME $USERNAME $RANDINT $NUMBER_OF_GUESSES
  fi  
}

GAME() {
  USERNAME=$1
  RANDINT=$2
  NUMBER_OF_GUESSES=$3
  echo -e "\nGuess the secret number between 1 and 1000:"
  read INPUT
  CHECK_INT $USERNAME $RANDINT $NUMBER_OF_GUESSES $INPUT
}

CHECK_INT() {
  USERNAME=$1
  RANDINT=$2
  NUMBER_OF_GUESSES=$3
  INPUT=$4
  while [[ ! $INPUT -eq RANDINT ]]
  do 
    if [[ ! $INPUT =~ ^[0-9]+$ ]]
    then 
      echo -e "That is not an integer, guess again:"
      read INPUT
    elif [[ $INPUT -gt $RANDINT ]]
    then 
      echo -e "It's higher than that, guess again:"
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
      read INPUT
    elif [[ $INPUT -lt $RANDINT ]]
    then 
      echo -e "It's lower than that, guess again:"
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
      read INPUT  
    fi  
  done 
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1)) 
  INSERT_DB $USERNAME $NUMBER_OF_GUESSES
  echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDINT. Nice job!"
}

INSERT_DB() {
  USERNAME=$1
  NUMBER_OF_GUESSES=$2
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  INSERT_NUMBER_OF_GUESSES=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID)")
  GAMES_PLAYED=$($PSQL "SELECT count(*) FROM games WHERE user_id=$USER_ID")
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED")
}

MAIN