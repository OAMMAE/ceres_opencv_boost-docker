FROM ubuntu:14.04

MAINTAINER OsamuAMMAE

####################
# ceres solver
####################
RUN apt-get update && apt-get install -y build-essential cmake && apt-get install -y libgoogle-glog-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev apt-file git vim

RUN apt-file update
# RUN apt-file search add-apt-repository
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y  ppa:bzindovic/suitesparse-bugfix-1319687
RUN apt-get update
RUN apt-get install -y libsuitesparse-dev

WORKDIR /
RUN git clone https://ceres-solver.googlesource.com/ceres-solver
WORKDIR /ceres-solver
RUN cmake .
RUN make install

COPY hello_ceres /root/hello_ceres


########################
# opencv
########################
RUN apt-get install -y libopencv-dev


########################
# boost
########################
RUN apt-get install -y libboost-all-dev


########################
#
########################
RUN apt-get install -y openssh-server tmux
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

WORKDIR /home

