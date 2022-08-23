# Chapter 1: Introduction

Benefits of docker:
- Packaging software in a way that leverages the skills developers already have
- Bundling application software and required OS filesystems together in a single standar‐ dized image format
- Using packaged artifacts to test and deliver the exact same artifact to all systems in all environments
- Abstracting software applications from the hardware without sacrificing resources

Docker is not:
- A virtual machine
- A cloud platform
- It is not a configuration management tool like puppet/chef/anisble
- Deployment framework. 
- An orchestration layer
- Something like vagrant

docker client -> docker command
docker server -> dockerd command
Dockage image -> filesystem and metadata
Docker container -> linux container started from a docker image
Atomic host -> small finely tuned OS image