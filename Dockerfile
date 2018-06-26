FROM cloudbees/jnlp-slave-with-java-build-tools
MAINTAINER Alex Aitken <aaitken@apixio.com>

USER root
RUN npm install -g yarn
RUN apt-get -y update
RUN apt-get -y install nfs-common
RUN mkdir /jenkins-shared
USER jenkins
