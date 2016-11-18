FROM centos:7

# This is a centos 7 workstation that can be deployed in cloud environments
# for troublesoohting

# Add the following repo :
# Install the following commands : ss ip nmap

RUN yum install -y iproute\
                   nmap\
                   tcpdump

RUN yum update
