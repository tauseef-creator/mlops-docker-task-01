FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install Flask

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["python", "app.py"]
