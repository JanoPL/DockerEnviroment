FROM ubuntu:16.04
LABEL Component="sshd" \
      Name="ubuntu/sshd" \
      version="1.2" \
      release="1" \
      author="JanoPL"

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y openssh-server

ARG ROOT_PASSWORD='root:THEPASSWORDYOUCREATED'

RUN mkdir /var/run/sshd
RUN echo ${ROOT_PASSWORD} | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]