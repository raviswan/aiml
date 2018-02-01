####################################################################
# Dockerfile to build sandbox for executing code entered in browser
####################################################################

FROM ubuntu:16.04
MAINTAINER RamV

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
RUN apt-get update

RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y python
RUN apt-get install -y r-base

WORKDIR /usr/src/python
COPY ./src .
