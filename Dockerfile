FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev
WORKDIR /
COPY ./requirements.txt /
RUN pip install wheel
RUN pip install -r requirements.txt
COPY . /
ENTRYPOINT ["python"]
CMD ["hello.py"]
