FROM daocloud.io/node:8.5-alpine

MAINTAINER zechengdai <dai.zecheng@freelog.com>

ARG VERSION=3.2.0

LABEL version=$VERSION

RUN mkdir /gitbook_fe
WORKDIR /gitbook_fe
COPY . /gitbook_fe

RUN npm install --global gitbook-cli &&\
	gitbook fetch 3.2.0 &&\
	gitbook install --save

EXPOSE 4007

CMD gitbook serve --port 4007