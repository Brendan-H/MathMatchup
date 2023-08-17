FROM maven:3.8.3-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

FROM eclipse-temurin:17
ADD target/mathmatchupbackend.jar mathmatchupbackend.jar
ENTRYPOINT ["java", "-jar", "mathmatchupbackend.jar"]
EXPOSE 8080

