FROM alpine:edge
RUN apk update && \
    apk add --no-cache ca-certificates caddy wget curl tor && \
    mkdir /tmp/xray &&\
    curl -L -H "Cache-Control: no-cache" -o /tmp/xray/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip &&\
    unzip /tmp/xray/xray.zip -d /tmp/xray &&\
    install -m 755 /tmp/xray/xray /usr/local/bin/xray &&\
    xray -version &&\
    rm -rf /tmp/xray &&\
    install -d /usr/local/etc/xray

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
