FROM python :3.8_slim

WORKDIR /app

RUN sudo apt-get update -y \
   && sudo apt-get upgrade -y \
   && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
   && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

CMD ["python","app.py"]
