FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre python

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.170/presto-server-0.170.tar.gz
RUN tar -xvzf presto-server-0.170.tar.gz
COPY etc presto-server-0.170/etc

EXPOSE 8080

WORKDIR presto-server-0.170
CMD ./bin/launcher run --verbose
