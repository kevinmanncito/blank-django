# Blank Django

This repo is set up to install django into a docker container and let you start from scratch with a django project. Here is what you need to do (assuming you have docker and docker-compose installed on your machine):

* Clone the repo (name it whatever you want the project to be named)
* `cd` into the repo and run `docker-compose build`
* Once that is done you can open a shell inside the python container with `docker-compose run --service-ports --rm web /bin/bash`
* From there you can run the `django-admin startproject <project name>` command
* That will create the folder containing the `manage.py` file.
* If you run the runserver command make sure to run it like this so you can access your django page outside the container `python manage.py runserver 0.0.0.0:8000`
    * You could also run `docker-compose run --rm --service-ports web python <project name>/manage.py runserver 0.0.0.0:8000` (from the same level as the Dockerfile).
* You should be able to see the default django homescreeen running locally on your machine! http://localhost:8000

<img width="1084" alt="Screen Shot 2021-09-23 at 11 34 42 AM" src="https://user-images.githubusercontent.com/2521298/134556293-fc8b3f08-4cb2-4410-a765-2b157892730d.png">
