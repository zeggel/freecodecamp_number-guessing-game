#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -n "Enter your username: "
read NAME

INFO=$($PSQL "SELECT * FROM players WHERE name = '$NAME'")
if [[ -z $INFO ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  PLAYED=0
  BEST=0
  ADD_PLAYER_RESULT=$($PSQL "INSERT INTO players (name, games_played, best_game) VALUES ('$NAME', $PLAYED, $BEST)")
  ID=$($PSQL "SELECT player_id FROM players WHERE name = '$NAME'")
else
  IFS="|" read ID NAME PLAYED BEST <<< "$INFO"
  echo "Welcome back, $NAME! You have played $PLAYED games, and your best game took $BEST guesses."
fi

SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))
echo -n "Guess the secret number between 1 and 1000: "
CURRENT_GUESSES=0

while [[ -z $WIN ]]
do
  read GUESS_NUMBER
  re='^[0-9]+$'
  if [[ $GUESS_NUMBER =~ $re ]]
  then
    CURRENT_GUESSES=$(( $CURRENT_GUESSES + 1 ))
    if [[ $GUESS_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo -n "It's lower than that, guess again: "
    else
      if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
      then
        echo -n "It's higher than that, guess again: "
      else
        RESULT=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE player_id = $ID")
        if [[ $CURRENT_GUESSES -lt $BEST || $BEST = 0 ]]
        then
          RESULT=$($PSQL "UPDATE players SET best_game = $CURRENT_GUESSES WHERE player_id = $ID")
        fi
        echo "You guessed it in $CURRENT_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        WIN=1
      fi
    fi
  else
    echo -n "That is not an integer, guess again: "
  fi
done
