# Dockerfile

FROM python:3.10

# install nginx and xmlsec dependencies
RUN apt-get update && apt-get install nginx libxml2-dev libxmlsec1-dev -y --no-install-recommends

# create app dir and copy requirements file
RUN mkdir -p /opt/app
COPY requirements.txt /opt/app/

# install python packages
WORKDIR /opt/app
RUN pip install -r requirements.txt --cache-dir /opt/app/pip_cache
