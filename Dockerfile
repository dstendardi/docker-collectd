FROM google/debian:wheezy
MAINTAINER David Stendardi

RUN apt-get update && apt-get -y install collectd
RUN apt-get install wget \
 && wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py \
 && pip install docker-py \
 && pip install pystache

ADD config.tpl /config.tpl
ADD run.py /run.py

CMD ["python", "/run.py"]
