FROM cloudbees/jnlp-slave-with-java-build-tools
MAINTAINER Alex Aitken <aaitken@apixio.com>

USER root
RUN npm install -g yarn
RUN apt-get update
RUN apt-get install nfs-common
RUN mkdir /jenkins-shared
RUN mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 10.199.1.72:/  /jenkins-shared
USER jenkins
