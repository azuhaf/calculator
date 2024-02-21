FROM openjdk:17-jdk
COPY ["build/libs/Calculator-0.0.1-SNAPSHOT.jar", "app1.jar"]
ENTRYPOINT ["java", "-jar", "app1.jar"]