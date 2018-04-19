# Blank Django

This repo is set up to install django into a docker container and let you start from scratch with a django project. Here is what you need to do (assuming you have docker and docker-compose installed on your machine):

* Clone the repo (name it whatever you want the project to be named)
* `cd` into the repo and run `docker-compose build`
* Once that is done you can open a shell inside the python container with `docker-compose run --rm web /bin/bash`
* From there you can run the `django-admin startproject <project name>` command
* That will create the folder containing the `manage.py` file.
* If you run the runserver command make sure to run it like this so you can access your django page outside the container `python manage.py runserver 0.0.0.0:8000`