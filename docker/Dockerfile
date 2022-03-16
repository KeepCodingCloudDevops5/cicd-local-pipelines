FROM python:3.9.7-slim

RUN pip install app-example-kc-cicd

COPY test.py .

ENTRYPOINT ["python", "test.py"]