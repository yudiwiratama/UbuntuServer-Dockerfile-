FROM ubuntu:latest

RUN apt-get update && apt-get install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN  echo 'test:test' | chpasswd

RUN echo 'root:1223' | chpasswd

RUN sed -ri 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
