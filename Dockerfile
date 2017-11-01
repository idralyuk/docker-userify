# Use lambdalinux/baseimage-amzn as base image.
# See https://hub.docker.com/r/lambdalinux/baseimage-amzn/tags/ for a list of version numbers.
FROM lambdalinux/baseimage-amzn:2017.03-004

COPY [ \
  "etc-runit-sshd-run", \
  "etc-runit-userify-run", \
  "creds.py", \
  "userify_config.py", \
  "/tmp/docker-build/" \
]

# Expose the SSH port
EXPOSE 2222

# Set working directory
WORKDIR /home/ll-user

RUN yum update -y && \
  yum install -y docker openssh-clients openssh-server sudo && \
  yum install -y cowsay fortune-mod telnet traceroute vi && \
  mkdir /etc/service/sshd && mkdir /etc/service/userify && \
  cp /tmp/docker-build/etc-runit-sshd-run /etc/service/sshd/run && \
  cp /tmp/docker-build/etc-runit-userify-run /etc/service/userify/run && \
  chmod 500 /etc/service/sshd/run && \
  chmod 500 /etc/service/userify/run && \
  sed -i -e 's/p SSHD_PORT/p 2222/' /etc/service/sshd/run && \
  curl -1 -sS "https://static.userify.com/installer.sh" | sh && \
  cp /tmp/docker-build/creds.py /opt/userify/creds.py && \
  cp /tmp/docker-build/userify_config.py /opt/userify/userify_config.py && \
  chmod 400 /opt/userify/creds.py && \
  chmod 400 /opt/userify/userify_config.py && \
  fortune -s | cowsay && \
  rm -rf /tmp/docker-build && \
  yum clean all && \
  rm -rf /var/cache/yum/* && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*

# Use baseimage-amzn's init system
CMD ["/sbin/my_init"]
