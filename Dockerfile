FROM nginx:alpine
RUN sed -i 's|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g' /etc/apk/repositories && \
     apk add bind-tools \
     bash \
     curl \
     wget \
     netcat-openbsd \
     busybox-extras \
     iptables \
     ipset \
     tmux \
     tcpdump
ADD .tmux.conf /root/.tmux.conf
