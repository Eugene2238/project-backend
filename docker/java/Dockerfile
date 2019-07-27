FROM openjdk:11.0.4-jdk

COPY ./target/project-0.0.1-SNAPSHOT.war /usr/app/

WORKDIR /usr/app

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.datasource.url=jdbc:mysql://mysql-db:3306/project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&failOverReadOnly=false&maxReconnects=10", "-jar", "project-0.0.1-SNAPSHOT.war"]

LABEL maintainer="Evgenii Koniakhin <eugene2238@gmail.com>" \
      version="1.0"
