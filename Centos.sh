#!/bin/bash
#Time: 2022/4/10 17:05
#1.0

back_file=/etc/yum.repos.d/CentOS-Base.repo.backup
#备份
if [ -e $back_file ]
then
	echo "存在备份文件!"
else
	echo "正在备份文件"
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
fi
function AliYun(){
	#下载阿里源文件
	wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
	if [ $? -eq 0 ]
	then
		yum makecache
		echo "换源成功"
	else
		curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
		if [ $? -eq 0 ]
		then
			yum makecacahe
			echo "换源成功!"
		else
			echo "换源失败!"
		fi
	fi
}

function USTC(){
	#下载阿里源文件
	wget -O /etc/yum.repos.d/CentOS-Base.repo https://cdn.jsdelivr.net/gh/lingkawaii/Linux_Mirror@1.0.0/Centos/USTC/Centos%207/CentOS-Base.repo
	if [ $? -eq 0 ]
	then
		yum makecache
		echo "换源成功"
	else
		curl -o /etc/yum.repos.d/CentOS-Base.repo https://cdn.jsdelivr.net/gh/lingkawaii/Linux_Mirror@1.0.0/Centos/USTC/Centos%207/CentOS-Base.repo
		if [ $? -eq 0 ]
		then
			yum makecacahe
			echo "换源成功!"
		else
			echo "换源失败!"
		fi
	fi
}

function tuna(){
	#下载阿里源文件
	wget -O /etc/yum.repos.d/CentOS-Base.repo https://cdn.jsdelivr.net/gh/lingkawaii/Linux_Mirror@1.0.0/Centos/tuna/Centos%207/CentOS-Base.repo
	if [ $? -eq 0 ]
	then
		yum makecache
		echo "换源成功"
	else
		curl -o /etc/yum.repos.d/CentOS-Base.repo https://cdn.jsdelivr.net/gh/lingkawaii/Linux_Mirror@1.0.0/Centos/tuna/Centos%207/CentOS-Base.repo
		if [ $? -eq 0 ]
		then
			yum makecacahe
			echo "换源成功!"
		else
			echo "换源失败!"
		fi
	fi
}
echo -n -e "(1)AliYun\n(2)USTC\n(3)tuna\n"
read -p "选择源:" num
case $num in
1) AliYun;;
2) USTC;;
3) tuna;;
esac
