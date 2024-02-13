FROM openjdk:17-jdk
COPY . /tmp
ENTRYPOINT ["java", "-jar", "app.jar"]