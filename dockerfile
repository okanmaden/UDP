FROM i386/centos:7

RUN yum -y update && \
yum -y groupinstall 'Development Tools' && \
yum -y install vim mlocate flex flex-devel net-tools gdb screen psmisc procps iptables

EXPOSE 6001/udp
ENV HOME /home/udp_server

RUN mkdir -p $HOME

WORKDIR $HOME
COPY udpserver.c $HOME/
RUN gcc -o udpserver udpserver.c
CMD ["/bin/bash","-c","gdb udpserver"]
