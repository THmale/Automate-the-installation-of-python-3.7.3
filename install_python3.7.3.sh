nstall dependencies
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


v="3.7.3"


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

