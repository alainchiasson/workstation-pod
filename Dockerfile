FROM centos:7

# This is a centos 7 workstation that can be deployed in cloud environments
# for troublesoohting

# Add the following repo :
# Install the following commands : ss ip nmap
RUN mkdir /build
ADD ./files-build/ /build/
RUN chmod --recursive go-rwx /build
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
RUN /bin/bash /build/prepare
RUN yum update

# keep your container alive until stop is sent. Using trap and
# wait will make your container react immediately.

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
