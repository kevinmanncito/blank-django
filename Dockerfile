FROM python:3.6
ENV PYTHONUNBUFFERED 1

# install google chrome
RUN apt-get -y update
RUN apt-get install -yqq unzip libxss1 libappindicator1 libindicator7 gconf-service libasound2 \
  libgconf-2-4 libnspr4 libnss3 libpango1.0-0 libxtst6 fonts-liberation xdg-utils \
  libgtk-3-0 lsb-release
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb

# install chromedriver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# install xvfb
RUN apt-get install -yqq xvfb

RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN pip install -r requirements.txt
