FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /var/lib/jenkins/workspace/BuildAndDeployECR/webapp/target/*.war /usr/local/tomcat/webapps

