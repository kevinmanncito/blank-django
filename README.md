# Blank Django

This repo is set up to install django into a docker container and let you start from scratch with a django project. Here is what you need to do (assuming you have docker and docker-compose installed on your machine):

* Clone the repo (name it whatever you want the project to be named)
* `cd` into the repo and run `docker-compose build`
* Once that is done you can open a shell inside the python container with `docker-compose run --service-ports --rm web /bin/bash`
* From there you can run the `django-admin startproject <project name>` command
* That will create the folder containing the `manage.py` file.
* If you run the runserver command make sure to run it like this so you can access your django page outside the container `python manage.py runserver 0.0.0.0:8000`
    * You could also run `docker-compose run --rm --service-ports web python <project name>/manage.py runserver 0.0.0.0:8000` (from the same level as the Dockerfile).
* This Dockerfile also includes google chrome/chromedriver + selelenium for headless browser tests. Here is a working example of a test case that uses headless Chrome:

```
from django.contrib.staticfiles.testing import StaticLiveServerTestCase

from selenium import webdriver


class FunctionalTest(StaticLiveServerTestCase):

    def setUp(self):
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-extensions')
        options.add_argument('--disable-gpu')
        options.add_argument('--no-sandbox')
        self.browser = webdriver.Chrome(chrome_options=options)

    def tearDown(self):
        self.browser.quit()

    def test_example(self):
        self.browser.get(self.live_server_url)
        self.browser.save_screenshot('test.png')
        self.assertIn('', self.browser.title)
```