FROM phusion/baseimage:0.9.15
MAINTAINER DMDirc <devs-public@dmdirc.com>
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN printf "%s\n%s" "8.8.8.8" "8.8.4.4" >> /etc/resolv.conf
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list.d/ansible.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7BB9C367
RUN apt-get update && apt-get install -y python \
                      python-yaml \
                      python-jinja2 \
                      ansible
WORKDIR /opt/ansible
ENTRYPOINT ["/sbin/my_init", "--"]
