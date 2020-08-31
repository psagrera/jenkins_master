FROM jenkins/jenkins:2.222-alpine 

RUN /usr/local/bin/install-plugins.sh git \
    gitlab-plugin \
    gitlab-hook \
    docker-workflow \
    robot ansible \
    build-pipeline-plugin \
    github-pullrequest \
    workflow-aggregator

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home
