# 百度网盘 WEB客户端

本容器基于 [BaiduPCS-Go](https://github.com/iikira/BaiduPCS-Go) 和 [baidupcs-web](https://github.com/liuzhuoling2011/baidupcs-web) 项目构建。实现基于 Docker 容器环境的百度网盘 Web 界面的访问。

### 使用方法

```bash
$ sudo docker run -d --name baidu-pcs \
    -v $PWD/baidu-pcs/downloads:/root/Downloads \
    -v $PWD/baidu-pcs/config:/root/.config/BaiduPCS-Go \
    -p 5299:5299 \
    getnas/baidu-pcs
```

> `-v` 参数指定映射到宿主机的下载目录和配置文件目录。

### 使用

浏览器访问 `http://your-ip.com:5299`