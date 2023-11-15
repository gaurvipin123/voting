FROM openjdk:17-jdk

WORKDIR /app

COPY target/VotingApp-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "VotingApp-0.0.1-SNAPSHOT.jar"]
