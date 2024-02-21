FROM openjdk:17-jdk
COPY ~./jenkins/workspace/Calculator/build/libs/Calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]