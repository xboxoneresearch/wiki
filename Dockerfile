FROM python:3-alpine

RUN apk add --no-cache git

WORKDIR /wiki
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Force /wiki directory to be considered safe for git
RUN git config --global --add safe.directory /wiki

CMD ["properdocs", "serve", "-a", "0.0.0.0:8000", "--strict"]
