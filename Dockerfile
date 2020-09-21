FROM jenkins/jenkins:lts-alpine 

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

USER root
# Install the latest Docker and docker-compose binaries
RUN apk -U --no-cache \
	--allow-untrusted add \
    gcc \
    docker \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY robot.groovy /usr/share/jenkins/ref/init.groovy.d/
VOLUME /var/jenkins_home
