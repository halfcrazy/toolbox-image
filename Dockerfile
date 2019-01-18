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
     tmux \
     tcpdump \
     ipvsadm \
     openssl \
     vim \
     iperf
COPY default.conf /etc/nginx/conf.d/
COPY .tmux.conf /root/.tmux.conf
EXPOSE 80
