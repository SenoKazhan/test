FROM maven:3.9.6-openjdk-17 AS build
COPY ./src src/
COPY ./pom.xml pom.xml
RUN mvn clean package -DskipTests


FROM openjdk:17.0.1-jdk-slim
COPY --from=builder target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]