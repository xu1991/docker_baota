FROM debian

#设置entrypoint和letsencrypt映射到www文件夹下持久化
COPY entrypoint.sh /entrypoint.sh
COPY set_default.py /set_default.py
 
RUN /bin/bash -c '\
sed -i "s/deb.debian.org/mirrors.ustc.edu.cn/g" /etc/apt/sources.list;\
apt-get update;\
export DEBIAN_FRONTEND=noninteractive;\
apt-get install -y init procps wget iproute2;\
export go=y;\
wget -O install.sh http://download.bt.sy/install/install-ubuntu_6.0.sh && sudo bash install.sh -y;\
export go=;\
export DEBIAN_FRONTEND=;\
bt 11;\
echo 123456 | bt 5 123456;\'
echo yxll | bt 6 yxll;\'

WORKDIR /www/wwwroot
CMD /entrypoint.sh
EXPOSE 8888 888 21 20 443 80

HEALTHCHECK --interval=5s --timeout=3s CMD curl -fs http://localhost:8888/ && curl -fs http://localhost/ || exit 1 
