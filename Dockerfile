FROM python:3.8.5

ENV DIRPATH=/code
WORKDIR $DIRPATH
COPY . .

RUN pip install -r requirements.txt

ENTRYPOINT [ "sh", "entrypoint.sh" ]
