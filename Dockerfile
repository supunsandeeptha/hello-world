FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
ADD /var/lib/jenkins/workspace/BuildAndDeployECR/webapp/target/webapp.war /usr/local/tomcat/webapps


