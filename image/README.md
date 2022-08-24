# Vagrant image Docker

This Vagrant image starts an Ubuntu machine and installs docker 

# Prerequisites

## Vagrant
Vagrant [See documentation](https://www.vagrantup.com/docs/installation)  
Virtualbox [See documentation](https://www.virtualbox.org/wiki/Downloads)

# How to
- Clone the repository to your local machine
```
git clone https://github.com/munnep/docker_up_and_running.git
```
- Go to the directory
```
cd docker_up_and_running/image
```
- Start a virtual machine with Vagrant 
```
vagrant up
```
- Logon to the machine
```
vagrant ssh
```
- Enjoy the use of docker
```
sudo docker info
```
- Stop the vagrant machine
```
vagrant halt
```
- When you are completely done you can remove it
```
vagrant destroy
```

# Done
- [x] Vagrant box
- [x] Install netdata 
- [x] Install Docker

# To do  