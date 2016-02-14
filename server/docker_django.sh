#!/bin/sh

PROJECT_NAME=${1:-"at_altitude"}
echo "Building Docker project: $PROJECT_NAME"

#mkdir $PROJECT_NAME
# cd $PROJECT_NAME

# echo "FROM django:1.8.3\nMAINTAINER Christian Clauss <ccc@zurich.ibm.com>\nENV PYTHONUNBUFFERED 1\nRUN mkdir /code\nWORKDIR /code\n ADD requirements.txt /code/\nRUN pip install -r requirements.txt\nADD . /code/\n" > Dockerfile

# echo "psycopg2\n" > requirements.txt

# echo "db:\n  image: postgres\nweb:\n  build: .\n  command: python manage.py runserver 0.0.0.0:8000\n  volumes:\n    - .:/code\n  ports:\n    - "8000:8000"\n  links:\n    - db\n " > docker-compose.yml

# cat docker-compose.yml


echo ""
ls
echo ""
docker-compose run web python -V
echo ""
docker-compose run web django-admin.py startproject $PROJECT_NAME .
echo ""
ls
echo ""
docker-compose run web python manage.py migrate
echo ""
ls
echo ""
cd $PROJECT_NAME
ls
vi settings.py
echo ""
docker-compose up -d
sleep 4
echo ""
docker ps
echo ""
boot2docker ip
