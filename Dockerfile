#
# Java 8 based image
#
# Dockerfile Version 1.0.5
# Oracle Java Developer Kit (JDK) version 1.8.0_66 64 bit
#

FROM debian:jessie

MAINTAINER Alexander Holbreich (http://alexander.holbreich.org)

# Install wget
RUN apt-get update && apt-get install -y wget && apt-get clean

#Some variables

ENV java_version 1.8.0_66
ENV filename jdk-8u66-linux-x64.tar.gz
#Download java
ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/8u66-b17/$filename -O /tmp/$filename

RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $downloadlink -O /tmp/$filename

RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/

#additional config
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000