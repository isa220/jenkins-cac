FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
ENV JENKINS_ADMIN_ID=admin
ENV JENKINS_ADMIN_PASSWORD=password
RUN jenkins-plugin-cli --plugins git:5.5.2 configuration-as-code:1873.vea_5814ca_9c93 matrix-auth:latest authorize-project:latest job-dsl:latest workflow-job:latest workflow-cps:latest blueocean:latest
COPY seedjob.groovy /usr/local/seedjob.groovy
COPY casc.yaml /var/jenkins_home/casc.yaml
