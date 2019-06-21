# !/bin/sh

v="3.7.3"

#Install dependencies
cd /usr/local/sbin
#Install development tool
apt-get update
yes | apt-get install build-essential

#install zlib
yes | apt-get install zlibc zlib1g-dev
yes | apt-get install libssl-dev
yes | apt-get install libpcre3 libpcre3-dev

#Install the missing dependency packages libffi-dev
yes | apt-get install libffi-dev


#install openssl

#Determine if the compressed package exists
#exist
if [ -f "openssl-1.1.1.tar.gz" ];then

	tar -xzvf openssl-1.1.1.tar.gz
	cd openssl-1.1.1
	./config --prefix=/usr/local/openssl shared zlib
	make && make install
	echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/openssl/lib" >> /etc/profile
	source /etc/profile

	#file is not exist
else
	wget http://www.openssl.org/source/openssl-1.1.1.tar.gz
	tar -xzvf openssl-1.1.1.tar.gz
	cd openssl-1.1.1
	./config --prefix=/usr/local/openssl shared zlib
	make && make install
	echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/openssl/lib" >> /etc/profile
	source /etc/profile
fi

cd /usr/local/sbin




#install python.x
#exist
if [ -f "Python-$v.tgz" ];then
	tar -xzvf Python-$v.tgz 
	cd Python-$v
	./configure --prefix=/usr/local/python-$v --with-openssl=/usr/local/openssl
	make && make install

	#file is not exist
else
	wget https://www.python.org/ftp/python/$v/Python-$v.tgz
	tar -xzvf Python-$v.tgz 
	cd Python-$v
	./configure --prefix=/usr/local/python-$v --with-openssl=/usr/local/openssl
	make && make install
fi

rm /usr/bin/python3 -rf

ln -s /usr/local/python-$v/bin/python${v:0:3}  /usr/bin/python3

rm /usr/bin/pip3   -rf 

ln -s /usr/local/python-$v/bin/pip${v:0:3} /usr/bin/pip3

#debian 9 install pip3
#download setuptools 

wget https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip

apt-get install unzip

unzip setuptools-41.0.1.zip 

cd setuptools-41.0.1

python3 setup.py build

python3 setup.py install

cd  /usr/local/sbin

# download pip 

wget https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz

tar -zxvf pip-19.1.1.tar.gz 

cd pip-19.1.1 

python3 setup.py build

python3 setup.py install

cd  /usr/local/sbin



