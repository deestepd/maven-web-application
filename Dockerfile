FROM tomcat:8.0.20-jre8
# Dummy text to test 
#i  love tomcat containers
COPY target/*.war /usr/local/tomcat/webapps/
