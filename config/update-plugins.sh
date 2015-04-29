#!/bin/bash
set -e

rm -fr /var/jenkins_home/war/WEB-INF/plugins/*
rm -fr /var/jenkins_home/plugins/*.jpi

cp  /usr/share/jenkins/ref/plugins/* /var/jenkins_home/war/WEB-INF/plugins/
