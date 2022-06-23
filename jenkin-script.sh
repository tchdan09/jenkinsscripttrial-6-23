#!/bin/bash
#                       Author :Danielle
#                       Date : 06/23/2022
#                      Script to install jenkins server

#                     Install java

sudo yum install java-1.8.0-openjdk-devel -y
# Enable the Jenkins repository
 sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 
 if [$? -ne 0] 
then
	sudo yum install wget -y
else 
	echo "wget is installed"
fi

#  disable key check on the repo, run
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#Install the latest stable version of Jenkins
sudo yum install jenkins

#start the service
sudo systemctl start jenkins

#Check the status
sudo systemctl status jenkins

#enable the Jenkins service 
sudo systemctl enable jenkins

#Adjust the firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
sudo firewall-cmd --reload


