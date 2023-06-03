FROM openjdk:17-jdk

WORKDIR /app

COPY target/docker-github-actions-0.0.1-SNAPSHOT.jar /app/docker-github-actions.jar

EXPOSE 8080

CMD ["java", "jar", "docker-github-actions.jar"]