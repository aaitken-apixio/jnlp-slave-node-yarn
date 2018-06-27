FROM cloudbees/jnlp-slave-with-java-build-tools
MAINTAINER Alex Aitken <aaitken@apixio.com>

USER root
RUN npm install -g yarn
RUN apt-get -y update
RUN mkdir -p /home/jenkins/.ivy2/
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/build.credentials
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/release.credentials
RUN chown jenkins:jenkins /home/jenkins/.ivy2/*
USER jenkins
RUN apt-get install -y sbt
USER root
RUN chown jenkins:jenkins -R /home/jenkins
USER jenkins
