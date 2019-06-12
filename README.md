# Automate-the-installation-of-python-x
自动化安装python3的各个版本（如：python3.5.6 、python3.6.8 、python3.7.3）
用脚本配置变量环境，默认安装python3.7.3；
可以手动修改脚本使安装python3.7.2、python3.7.1等；
目前在Debian系统已测试成功；
可以判断/usr/local/sbin下是否有安装包，如有安装包就不再从网上下载
注：所有的脚本和源码压缩包都放在/usr/local/sbin目录下
想要下载指定python版本，仅需修改install_python-x.sh脚本的第二行 v="3.7.3"中的版本号
