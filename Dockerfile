FROM jenkins/jenkins:alpine

RUN /usr/local/bin/install-plugins.sh git gitlab-plugin gitlab-hook docker-workflow robot ansible build-pipeline-plugin 

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home