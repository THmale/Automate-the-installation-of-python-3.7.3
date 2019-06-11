# !/bin/sh
#Install dependencies
cd /usr/local/sbin
#Install development tool
apt-get update
yes | apt-get install build-essential

#install zlib
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

#install python3.7.3
#exist
if [ -f "Python-3.7.3.tgz" ];then
tar -xzvf Python-3.7.3.tgz 
cd Python-3.7.3
./configure --prefix=/usr/local/python3.7 --with-openssl=/usr/local/openssl
make && make install

#file is not exist
else
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
tar -xzvf Python-3.7.3.tgz 
cd Python-3.7.3
./configure --prefix=/usr/local/python3.7 --with-openssl=/usr/local/openssl
make && make install
fi


ln -s /usr/local/python3.7/bin/python3.7 /usr/bin/python3

ln -s /usr/local/python3.7/bin/pip3.7 /usr/bin/pip3

