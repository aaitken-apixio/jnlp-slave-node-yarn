FROM cloudbees/jnlp-slave-with-java-build-tools-dockerfile
MAINTAINER Alex Aitken <aaitken@apixio.com>

USER root
RUN apk update
RUN apk add yarn
USER jenkins
