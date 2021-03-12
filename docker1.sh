sudo cat <<EOF > /etc/yum.repos.d/docker.repo
[docker]
name=docker
baseurl=https://download.docker.com/linux/centos/7/x86_64/stable/
gpgcheck=0
EOF
sudo yum install docker-ce --nobest -y

sudo systemctl restart docker

sudo docker ps

sudo docker run -dit --name myos1 -p 8085:80 centos:7
sudo docker exec -it myos1  yum install httpd  -y
sudo docker exec -it myos1  yum install net-tools  -y
sudo cat /root/a.html >>  This is sample file
sudo docker cp    myos1:/root/a.html /var/www/html/
sudo docker exec -it myos1  /usr/sbin/httpd/
