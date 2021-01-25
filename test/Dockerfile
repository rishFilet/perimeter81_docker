FROM centos:8

RUN yum update -y
RUN yum install dnf-plugins-core -y
RUN dnf config-manager --set-enabled powertools
RUN yum install  xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps -y
RUN yum install -y xeyes
CMD ["/usr/bin/xeyes"]


