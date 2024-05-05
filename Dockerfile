FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
COPY ./src src/
COPY ./pom.xml pom.xml
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
COPY --from=builder target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]