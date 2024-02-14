FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/Anil0192yadav/Hello-World.git 

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
ls -alrt  
RUN mvn clean install  

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/maven-project.jar /app 
CMD ["java -jar maven-project.jar"]
