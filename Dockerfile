FROM phusion/baseimage:0.9.15
MAINTAINER Greg Holmes <docker@greboid.com>
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN echo 8.8.8.8 > /etc/resolv.conf
RUN echo 8.8.4.4 > /etc/resolv.conf
RUN apt-get update
RUN apt-get install python python-yaml python-jinja2 -y
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install ansible -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD runansible /opt/runansible
WORKDIR /opt/ansible
ENTRYPOINT ["/sbin/my_init", "--", "/opt/runansible"]
