FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /opt

COPY settings.xml /usr/share/maven/conf/settings.xml

COPY . .

RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:17-oracle AS publish

ENV JAVA_OPTS=""

WORKDIR /opt

COPY --from=build /opt/target/*.jar ./app.jar

ENTRYPOINT exec java ${JAVA_OPTS} -jar app.jar