FROM alpine:3.7

MAINTAINER Naren <nanichowdary.ravilla@gmail.com>

ENV LANG=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8

RUN echo "ipv6" >> /etc/modules

RUN apk --update add build-base && \
	apk add alpine-sdk && \
	apk add libressl-dev && \
	apk add openssl && \
	apk add libffi && \
	apk add libffi-dev && \
	apk add --no-cache python && \
	apk add --no-cache python-dev && \
	apk add --no-cache py-pip && \
	python -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip install --upgrade pip setuptools && \
	pip install cryptography && \
	rm -r /root/.cache

RUN mkdir /app
WORKDIR /app

RUN python -V

CMD ["python2"]

MAINTAINER nanichowdary.ravilla@gmail.com
ARG proxy
ENV https_proxy=$proxy \
	LANG=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8
COPY src /apps
WORKDIR /apps
RUN python -V
RUN pip install cryptography && pip install pipenv && pipenv install
CMD ["sh","/apps/bootstrap.sh"]
