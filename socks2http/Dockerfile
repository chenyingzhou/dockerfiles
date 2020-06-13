FROM ubuntu:16.04

# 安装privoxy
RUN apt-get update \
    && apt-get install -y privoxy \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# 添加启动脚本
ENV SOCKS_HOST 0.0.0.0:1080
RUN { \
            echo "#!/bin/bash"; \
            echo "sed -i 's/^listen-address/# listen-address/' /etc/privoxy/config"; \
            echo "sed -i 's/^forward-socks5t/# forward-socks5t/' /etc/privoxy/config"; \
            echo "echo 'listen-address 0.0.0.0:1081' >> /etc/privoxy/config"; \
            echo "echo \"forward-socks5t / \${SOCKS_HOST} .\" >> /etc/privoxy/config"; \
            echo "privoxy --no-daemon /etc/privoxy/config"; \
        } | tee /start.sh \
    && chmod 755 /start.sh

EXPOSE 1081

CMD /start.sh