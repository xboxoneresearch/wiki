FROM python:3.11-alpine

RUN apk add git

WORKDIR /wiki
COPY requirements.txt .
RUN pip install -U -r requirements.txt

# Force /wiki directory to be considered safe for git
RUN git config --global --add safe.directory /wiki

RUN echo $'#!/bin/sh\n\
    cd /wiki\n\
    mkdocs serve -a $(hostname -i):8000 --strict' > /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
