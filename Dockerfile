FROM alpine

RUN apk add --update python openjdk8-jre libffi-dev openssl-dev krb5-dev java-snappy

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.170/presto-server-0.170.tar.gz
RUN tar -xvzf presto-server-0.170.tar.gz
COPY etc presto-server-0.170/etc

EXPOSE 8080

WORKDIR presto-server-0.170
CMD ./bin/launcher run --verbose
