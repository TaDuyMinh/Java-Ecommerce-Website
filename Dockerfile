FROM maven:4.0.0-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:11-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar personalproject.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","personalproject.jar"]
