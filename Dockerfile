FROM jenkins/jnlp-slave:alpine
MAINTAINER Yannik Ehlert <kontakt@yanniks.de>

USER root
RUN apx update
RUN apk add nodejs
RUN apk add yarn
USER jenkins