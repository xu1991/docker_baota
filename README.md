 # 宝塔面板一键docker部署 
镜像为绑定github的dockerfile文件在dockerHub上自动生成,所以不可能有植入后台的行为,请放心使用.  
镜像生成文件可以在github上查看.请大家监督.  
制作这个纯粹是为了赚点github的关注量,好用之余请不要忘了去github加个Star一下哦,链接在最下方

### 通过host模式运行宝塔镜像  
`docker run -tid --name baota --net=host --privileged=true --shm-size=1g --restart always -v ~/wwwroot:/www/wwwroot pch18/baota`

建议使用上述host网络模式启动,不需要设置映射端口,自动映射宝塔面板全端口到外网  
正常的bridge模式可能会造成网站后台不能获取用户真实ip地址.


###  通过bridge模式运行宝塔镜像  
**如果特殊情况不能使用host网络模式(macos和windows不支持host), 使用下述命令重新以bridge网络模式运行**

`docker run -tid --name baota -p 80:80 -p 443:443 -p 8888:8888 -p 888:888 --privileged=true --shm-size=1g --restart always -v ~/wwwroot:/www/wwwroot pch18/baota`

###  登录方式  
- 登陆地址 `http://{{面板ip地址}}:8888`
- 初始账号 `username`
- 初始密码 `password`

由于docker镜像的特殊性，随机密码是安装面板的时候生成的，  
所有用户的随机密码其实都相同，没有随机的意义，  
为了方便部署，已经去除安全入口，且设置成上述密码，  
请大家登陆后第一时间修改账号密码！！  
    
### 删除容器命令如下  
`docker rm -fv baota`
