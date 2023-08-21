# Use the official Maven image to build the application and create the JAR
# do mvn package -DskipTests and then git push. Finally, build on render.com to get it working. Postgres will need to be rebuilt
# 90 days from august 16, 2023 (November 14)
FROM maven:3.8.3-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM eclipse-temurin:17
ADD target/mathmatchupbackend.jar mathmatchupbackend.jar
ENTRYPOINT ["java", "-jar", "mathmatchupbackend.jar"]
EXPOSE 8080

