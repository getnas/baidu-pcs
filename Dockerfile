FROM lsiobase/alpine
LABEL maintainer="Herald Yu <yuhr123@gmail.com>"

ENV TZ=Asia/Shanghai

COPY ./BaiduPCS-Go /usr/bin/BaiduPCS-Go

RUN set -x \
    && chmod a+x /usr/bin/BaiduPCS-Go

VOLUME ["/root/Downloads"]
VOLUME ["/root/.config/BaiduPCS-Go"]
EXPOSE 5299

CMD [ "/usr/bin/BaiduPCS-Go" ]