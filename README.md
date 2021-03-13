### Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins

Hello Guys !! back with another Automation Repo !! In this Repo you will find a  **docker.sh**  script which will helps you to install docker and the **Configuring Apache Webserver**

![Jenkins](https://tinderengineering.ghost.io/content/images/2017/05/jenkins_blogbanner.gif)

## Job Creation:

Now first step is to create a **job**. It's simple and straight forward to create a job. 
![job creation](https://github.com/amit17133129/Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins/blob/master/Project_Images/creatin%20job.jpg?raw=true)

1. Give Job **Name**
2. Select **Freestyle** Project
3. Click on **ok**

Now this looks something like this. I used the image when job has run already
![job1](https://github.com/amit17133129/Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins/blob/master/Project_Images/Job.jpg?raw=true)

After that, we need to **configure the job**. Click on the configure option then you will able to see the options to add the **git repo** and some more **SCM** options.

## Configuring Gu=itHub Repo:
![job2](https://github.com/amit17133129/Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins/blob/master/Project_Images/github%20repo.jpg?raw=true)
This will add the github repo. All the codes will be downloaded in the e=respective location. 

## Github Repo Include Bash script:

```
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
sudo docker exec -i myos1  yum install httpd  -y
sudo docker exec -i myos1  yum install net-tools  -y
sudo docker cp  /root/a.html  myos1:/var/www/html/
sudo docker exec -i myos1  /usr/sbin/httpd
```
## Docker Script do the following:
This Above code will create a 
1. **docker repo** 
2. **Install Dokcer**
3. **Launch Container**
4. **Copy html files in /var/www/html**
5. **Restart httpd services**

## Execute Shell:
We need to Copy the **docker.sh** script inside respective system.
![command](https://github.com/amit17133129/Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins/blob/master/Project_Images/commands.jpg?raw=true)


## Job Running Automatically:
As also the Job should run if the job run automatically then is=f any codes changes then it should run ahain so to fullfil this we are use **Poll SCM** Trigger. Also my jenkins trigger must go to github every minute * * * * *

![Poll SCM](https://github.com/amit17133129/Configuring-Apache-Webserver-in-Docker-Conatiners-Using-Jenkins/blob/master/Project_Images/poll%20scm.jpg?raw=true)

