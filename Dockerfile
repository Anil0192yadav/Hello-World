
FROM maven:3.8.4-jdk-11 AS build

WORKDIR /home/ec2-user/

COPY . .

RUN mvn clean install

FROM tomcat:9.0-jdk11-openjdk-slim

WORKDIR /usr/local/tomcat/webapps

COPY --from=build /home/ec2-user/webapp/target/webapp.war .

EXPOSE 8080

CMD ["catalina.sh", "run"]
