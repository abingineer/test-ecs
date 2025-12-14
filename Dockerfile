FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/*.jar testecs.jar
EXPOSE 8080
CMD ["java","-jar","testecs.jar"]