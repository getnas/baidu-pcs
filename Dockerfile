FROM lsiobase/alpine
LABEL maintainer="Herald Yu <yuhr123@gmail.com>"

RUN apk add --update curl wget jq unzip \
    && rm -rf /var/cache/apk/*

ENV TZ=Asia/Shanghai
ENV release=

RUN \
    echo "**** install packages ****" \
    && set -x \
    && cd /tmp \
    && release=${release:-$(curl -s https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest | jq -r .tag_name )} \
    && wget https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${release}/BaiduPCS-Go-${release}-linux-amd64.zip \
    && unzip ./BaiduPCS-Go-${release}-linux-amd64.zip \
    && mv BaiduPCS-Go-${release}-linux-amd64/BaiduPCS-Go /usr/bin/BaiduPCS-Go \
    && chmod a+x /usr/bin/BaiduPCS-Go \
    && rm -rf BaiduPCS-Go-${release}-linux-amd64*

VOLUME ["/root/Downloads"]
VOLUME ["/root/.config/BaiduPCS-Go"]
EXPOSE 5299

CMD [ "/usr/bin/BaiduPCS-Go" ]