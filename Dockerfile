FROM centos:7
MAINTAINER sealeg <https://github.com/sealeg> 

RUN yum -y update \
 && yum -y install epel-release \
 && yum -y install certbot \
 && yum clean all


