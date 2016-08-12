FROM jenkins:2.7.2-alpine
MAINTAINER ototadana@gmail.com

USER root

RUN apk add --no-cache sudo vim

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

COPY ./config/. /config/
RUN mkdir /config/plugins
RUN chown -R jenkins:jenkins /config
RUN chmod +x /config/*

USER jenkins
RUN /usr/local/bin/plugins.sh /config/plugins.txt

ENTRYPOINT ["/config/entrypoint"]
CMD ["/usr/local/bin/jenkins.sh"]
