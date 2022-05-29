#Deriving the latest base image
FROM python:latest

LABEL Maintainer="its-sushant"

COPY requirements.txt requirements.txt


RUN apt-get update 
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN apt-get install -y build-essential libzbar-dev
RUN pip3 install -r requirements.txt

WORKDIR /home/shushant/Qrscanner
WORKDIR /home/shushant/Qrscanner/Barcodes

COPY readbc.py ./

CMD [ "python", "readbc.py", "/home/shushant/Qrscanner/Barcodes/", "barcode.txt"]