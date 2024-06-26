FROM python:3.9-slim-bullseye

RUN apt update && apt upgrade -y && apt install libgl1 -y && apt install libglib2.0-0 -y

WORKDIR /app

COPY ./api /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
