FROM python:3.12-slim

MAINTAINER Tuan Thai "tuanthai@example.com"

# Cài đặt các gói phụ thuộc
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Thêm mã nguồn vào container
ADD . /flask_app
WORKDIR /flask_app

# Cài đặt các gói từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Chạy ứng dụng Flask
ENTRYPOINT ["python"]
CMD ["flask_docker.py"]
