FROM nginx:alpine

ENV PORT 80

RUN sed -i 's|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g' /etc/apk/repositories && \
     echo "http://mirrors.aliyun.com/alpine/edge/testing" >> /etc/apk/repositories && \
     apk add --no-cache bind-tools \
     bash \
     sed \
     curl \
     wget \
     strace \
     netcat-openbsd \
     busybox-extras \
     iproute2 \
     mtr \
     hping3 \
     arping \
     apache2-utils \
     dhclient \
     net-tools \
     iptables \
     ip6tables \
     ipset \
     ethtool \
     tmux \
     tcpdump \
     tcpflow \
     tshark \
     ipvsadm \
     openssl \
     vim \
     iperf \
     iperf3 \
     nmap \
     tini \
     lrzsz \
     open-lldp \
     py3-pip && \
     pip3 install scapy -i https://mirrors.aliyun.com/pypi/simple/

EXPOSE 80

COPY default.conf /etc/nginx/conf.d/
COPY .tmux.conf /root/.tmux.conf
COPY ./entrypoint.sh /
ENTRYPOINT ["/sbin/tini", "-g", "--", "/entrypoint.sh"]
