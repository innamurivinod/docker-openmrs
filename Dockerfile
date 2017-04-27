FROM ubuntu:16.04
RUN apt-get update  && apt-get install -y openjdk-8-jdk
ADD apache-tomcat-7.0.77 /usr/share/apache-tomcat-7.0.77
RUN initctl reload-configuration && mkdir /root/.OpenMRS
ADD tomcat-users.xml /usr/share/apache-tomcat-7.0.77/conf/tomcat-users.xml
ADD web.xml /usr/share/apache-tomcat-7.0.77/webapps/manager/WEB-INF/web.xml
ADD https://excellmedia.dl.sourceforge.net/project/openmrs/releases/OpenMRS_Platform_2.0.1/openmrs.war /usr/share/apache-tomcat-7.0.77/webapps/openmrs.war
RUN chmod +x /usr/share/apache-tomcat-7.0.77/webapps/openmrs.war
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh
EXPOSE 8080
CMD ["/root/start.sh", "run"]
