#!/bin/bash          
if [ "$#" -ne 1 ]
then
  echo "Usage:please enter a project name...exiting!!"
  exit 1
fi
PROJECT_NAME="$1"
echo "created Project directory name is $PROJECT_NAME" 
mkdir $PROJECT_NAME && cd $PROJECT_NAME
echo "creating virtualenv venv"
virtualenv venv --distribute
source venv/bin/activate
pip install django-toolbelt
django-admin.py startproject $PROJECT_NAME .
echo "web: gunicorn $PROJECT_NAME.wsgi" > Procfile
pip freeze > requirements.txt
git init
wget -c https://raw.github.com/github/gitignore/master/Python.gitignore && mv Python.gitignore  .gitignore
git add . 
git commit -m "my first commit"
heroku create
git push heroku master

