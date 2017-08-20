FROM jenkinsci/blueocean:1.1.7-33588ba56316
MAINTAINER ototadana@gmail.com

USER root
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

COPY ./config/. /config/
RUN mkdir /config/plugins
RUN chown -R jenkins:jenkins /config
RUN chmod +x /config/*
RUN /usr/local/bin/install-plugins.sh `cat /config/plugins.txt`

USER jenkins
ENTRYPOINT ["/config/entrypoint"]
CMD ["/usr/local/bin/jenkins.sh"]
