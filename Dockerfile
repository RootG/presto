FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre python

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.170/presto-server-0.170.tar.gz
RUN tar -xvzf presto-server-0.170.tar.gz --transform 's/presto-server-0.170/presto/'
COPY etc presto/etc

VOLUME /var/presto/data
VOLUME /presto/etc/catalog
EXPOSE 8080

WORKDIR presto
CMD ./bin/launcher run --verbose
