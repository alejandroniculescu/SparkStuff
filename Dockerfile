#FROM ubuntu:14.04
#MAINTAINER Alexander Niculescu <al3xander.niculescu@gmail.com>



FROM gelog/java:openjdk7

#MAINTAINER Francois Langelier
#https://github.com/GELOG/docker-ubuntu-spark/blob/master/spark-1.5/Dockerfile

ENV WGET_VERSION       1.15-1ubuntu1.14.04.1
ENV SPARK_VERSION      1.6.0
ENV SPARK_BIN_VERSION  $SPARK_VERSION-bin-hadoop2.3
ENV SPARK_HOME         /usr/local/spark
ENV PATH               $PATH:$SPARK_HOME/bin


# Installing wget
RUN \
    apt-get update && \
    apt-get install -y wget=$WGET_VERSION && \
    rm -rf /var/lib/apt/lists/*


# Installing Spark for Hadoop
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_BIN_VERSION.tgz && \
    tar -zxf /spark-$SPARK_BIN_VERSION.tgz -C /usr/local/ && \
    ln -s /usr/local/spark-$SPARK_BIN_VERSION $SPARK_HOME && \
    rm /spark-$SPARK_BIN_VERSION.tgz


#DGA
#https://github.com/Sotera/distributed-graph-analytics/tree/master/dga-graphx


CMD sudo apt-get update
CMD sudo apt-get install software-properties-common
CMD sudo apt-get install python-software-properties

#apt repository
#RUN sudo apt-get install software-properties-common

#Gradle
CMD sudo add-apt-repository ppa:cwchien/gradle
CMD sudo apt-get update
CMD sudo apt-get install gradle

#Scala
# scala install
wget www.scala-lang.org/files/archive/scala-2.11.7.deb
sudo dpkg -i scala-2.11.7.deb


# sbt installation
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt


# java install
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer



##SPARK OUTPUT
# Default action: show available commands on startup
#CMD ["spark-submit"]
