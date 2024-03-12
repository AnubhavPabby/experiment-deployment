# Use an official OpenJDK runtime as a parent image
#FROM openjdk:11-jre-slim
## Set the working directory in the container
#WORKDIR /app
## Copy the JAR file into the container at /app
#COPY target/your-spring-boot-app.jar /app/
## Expose the port the app runs on
#EXPOSE 8082
## Specify the command to run on container start
#CMD ["java", "-jar", "your-spring-boot-app.jar"]

#FROM openjdk:11
#VOLUME /tmp
#EXPOSE 8080
#ARG JAR_FILE=target/spring-boot-docker.jar
#ADD ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]
#
#FROM openjdk:17-jdk-alpine
#MAINTAINER baeldung.com
#COPY target/docker-message-server-1.0.0.jar message-server-1.0.0.jar
#ENTRYPOINT ["java","-jar","/message-server-1.0.0.jar"]


# FROM openjdk:17-jdk-alpine
# VOLUME /tmp
# WORKDIR /app
# EXPOSE 8082
# COPY target/springboot-basics-0.0.1-SNAPSHOT.jar /app/
# ENTRYPOINT ["java","-jar","/app/springboot-basics-0.0.1-SNAPSHOT.jar"]

# FROM openjdk:17-jdk-alpine
# VOLUME /tmp
# COPY target/*.jar app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]
# EXPOSE 8082

#FROM openjdk:17-jdk-alpine
#VOLUME /tmp
#COPY target/*.jar app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

#
# Build stage
#
FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM eclipse-temurin:17-alpine
COPY --from=build /target/springboot-basics-0.0.1-SNAPSHOT.jar app.jar
# ENV PORT=8080
EXPOSE 8082
ENTRYPOINT ["java","-jar","app.jar"]

##
## Build stage
##
#FROM maven:3.8.3-openjdk-17 AS build
#COPY . .
#RUN mvn clean install
#
##
## Package stage
##
#FROM eclipse-temurin:17-jdk
#COPY --from=build /target/springboot-basics-0.0.1-SNAPSHOT.jar app.jar
## ENV PORT=8080
#EXPOSE 8082:8082
#ENTRYPOINT ["java","-jar","app.jar"]
