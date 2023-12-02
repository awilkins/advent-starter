#!/bin/bash

DAYPAD="0$1"

YEAR="$(git name-rev --name-only HEAD | cut -c 1-4)"
DAY="${DAYPAD: -2}"

NAME=$2

if [ -z $1 ]
then
  echo "Must provide a day number"
  exit 1
fi

if [ -z $NAME ]
then
  echo "Must provide a name for your module"
  exit 1
fi

mkdir -p {resources,advent}"/day_${DAY}"
touch "advent/day_${DAY}/__init__.py"

cp templates/python/test_code_head.py "advent/day_$DAY/test_$2.py"

{
  echo "DAY=\"$DAY\""
  printf "\nfrom advent.day_%s.%s import *\n" "$DAY" "$NAME"
} >> "advent/day_$DAY/test_$2.py"

cat templates/python/test_code_foot.py >> "advent/day_$DAY/test_$2.py"


cp templates/python/code.py "advent/day_$DAY/$2.py"

# Get input
if [ -n "$AOC_TOKEN" ]
then
  curl "https://adventofcode.com/${YEAR}/day/${1}/input" --cookie "session=${AOC_TOKEN}" > "resources/day_$DAY/input.txt"
else
  echo "AOC_TOKEN not found, skipping input fetch - put input in resources/day_$DAY/input.txt"
fi

# Open VSCode windows on the code we created
code "advent/day_$DAY/$2.py" "advent/day_$DAY/test_$NAME.py"
