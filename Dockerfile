FROM nginx:alpine
RUN sed -i 's|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g' /etc/apk/repositories && \
     apk add bind-tools \
     bash \
     curl \
     wget \
     netcat-openbsd \
     busybox-extras \
     iproute2 \
     apache2-utils \
     net-tools \
     iptables \
     ipset \
     ethtool \
     tmux \
     tcpdump \
     tcpflow \
     ipvsadm \
     openssl \
     vim \
     iperf \
     ntop \
     tini

EXPOSE 80

COPY default.conf /etc/nginx/conf.d/
COPY .tmux.conf /root/.tmux.conf
COPY ./entrypoint.sh /
ENTRYPOINT ["/sbin/tini", "-g", "--", "/entrypoint.sh"]
