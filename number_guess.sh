#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ $USER_ID ]]
then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  USER_MIN_ATT=$($PSQL "SELECT best FROM users WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $USER_MIN_ATT guesses."
else
  USER_INS=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

ATT=0
RAN_NUM=$(( RANDOM % 1000 + 1 ))

GUESS_FUNC() {
  (( ATT++ ))
  if [[ ! -z $1 ]]
  then
    echo "$1"
  else 
    echo "Guess the secret number between 1 and 1000:"
  fi
  read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_FUNC "That is not an integer, guess again:"
  elif [[ $RAN_NUM > $GUESS ]]
  then
    GUESS_FUNC "It's higher than that, guess again:"
  elif [[ $RAN_NUM < $GUESS ]]
  then
    GUESS_FUNC "It's lower than that, guess again:"
  elif [[ $RAN_NUM -eq $GUESS ]]
  then
    echo "You guessed it in $ATT tries. The secret number was $RAN_NUM. Nice job!"
  fi
}

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
(( GAMES_PLAYED++ ))
NEW_GAMES=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")

GUESS_FUNC

USER_MIN_ATT=$($PSQL "SELECT best FROM users WHERE user_id=$USER_ID")
if [[ -z $USER_MIN_ATT ]] 
then
  NEW_BEST=$($PSQL "UPDATE users SET best=$ATT WHERE user_id=$USER_ID")
fi