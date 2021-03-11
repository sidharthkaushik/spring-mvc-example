FROM tomcat:9-jre8
ENV JAVA_OPTS="-Xms512m -Xmx1024m -XX:MaxPermSize=256m -XX:MaxMetaspaceSize=128m"
WORKDIR /usr/local/tomcat/webapps/
# RUN rm -rf /usr/local/tomcat/webapps/*
LABEL maintainer="sidharth.kaushik@nagarro.com"

ADD target/spring-mvc-example.war /usr/local/tomcat/webapps/
ADD ssl/lwa01_ikon_assaabloy_com.p12 /usr/local/tomcat/ssl/
ADD ssl/server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8443
CMD ["catalina.sh", "run"]