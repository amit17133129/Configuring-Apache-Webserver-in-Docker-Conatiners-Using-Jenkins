sudo cat <<EOF > /etc/yum.repos.d/docker.repo
[docker]
name=docker
baseurl=https://download.docker.com/linux/centos/7/x86_64/stable/
gpgcheck=0
EOF
sudo yum install docker-ce --nobest -y

sudo systemtcl start docker

sudo docker ps

sudo docker run -dit --name myos centos:7
