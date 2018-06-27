FROM cloudbees/jnlp-slave-with-java-build-tools
MAINTAINER Alex Aitken <aaitken@apixio.com>

ENV SBT_VERSION 1.1.6

USER root
RUN npm install -g yarn
RUN apt-get -y update
RUN mkdir -p /home/jenkins/.ivy2/
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/build.credentials
RUN printf "realm=Sonatype Nexus Repository Manager\n# realm=Artifactory Realm\nhost=repos.apixio.com\nuser=jenkins\npassword=bh29rWAJbc\n" > /home/jenkins/.ivy2/release.credentials
RUN sudo apt-get install -y sbt
RUN chown jenkins:jenkins -R /home/jenkins
USER jenkins
# Install sbt
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin
