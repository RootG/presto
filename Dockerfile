FROM ubuntu

RUN apt-get update && apt-get install -y wget openjdk-8-jre python

ARG PRESTO_VERSION=0.170

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz
RUN mkdir /presto
RUN tar -xvzf presto-server-${PRESTO_VERSION}.tar.gz -C /presto --strip-components 1
RUN rm presto-server-${PRESTO_VERSION}.tar.gz
COPY etc /presto/etc

VOLUME /var/presto/data
VOLUME /presto/etc
EXPOSE 8080

WORKDIR /presto
CMD ./bin/launcher run --verbose
