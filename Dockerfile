FROM amazon/aws-cli:2.13.12

RUN yum update -y \
  && yum install -y git docker-compose-plugin  \
  && yum clean all
