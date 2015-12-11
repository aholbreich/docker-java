#
# Java 7 based image
# Version 1.1.1
# 
# Java version 1.7.0_65 64 bit
# Build #01
#
FROM debian:jessie

MAINTAINER Alexander Holbreich (http://alexander.holbreich.org)

#Install wget
RUN apt-get update && apt-get install -y wget && apt-get clean

#Some variables
ENV java_version 1.7.0_65
ENV filename jdk-7u65-linux-x64.tar.gz
ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/7u65-b17/$filename -O /tmp/$filename

#Download java
RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $downloadlink -O /tmp/$filename

RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle

ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000