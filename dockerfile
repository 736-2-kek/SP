FROM amazonlinux:1
RUN yum -y install sudo
RUN sudo yum update -y && yum upgrade -y
RUN sudo yum install yum-utils -y
COPY ./lena.sh /lena.sh
CMD ./lena.sh
