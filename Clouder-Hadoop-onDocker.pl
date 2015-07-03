# Setting up Cloudera

# Version Levels used
	## Windows 7
	## Boot2Docker 1.7.0
	## Docker 1.7.0
	## CentOS 6.6 (Docker image from 
	## Cloudera 5.4.3
	

# Setup boot to docker (in windows 7)
	## Boot2Docker version 1.7.0, build master : 7960f90 - Thu Jun 18 18:31:45 UTC 2015 
	## Docker version 1.7.0, build 0baf609
# The client comes up with IP 192.168.59.103, default username :docker Password :tcuser

## Now lets setup Docker to be used as Name nodes(x 1) and Data nodes (x 2), Intitally we will try to setup with 3 containers.

# Download centos6.6 image from docker
	## We will use centos 6x as that is the highest version supported by Cloudera
	## Cloudera 5.4.3 will be used.

# Clone the container so we can have a backup and dont have to download it again and again (especially useful when you are on slow networks )


#########################################################
## You will need to save the docker image as a tar file:

docker save -o <save image to path> <image name>
## Then copy your image to a new system with regular file transfer tools such as cp or scp. After that you will have to load the image into docker:

docker load -i <path to image tar file>
#########################################################


