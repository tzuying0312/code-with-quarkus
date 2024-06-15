## Stage 1 : build with maven builder image with native capabilities
FROM quay.io/quarkus/ubi-quarkus-mandrel-builder-image:jdk-21 AS build
USER root
COPY --chown=quarkus:quarkus pom.xml /code/
COPY --chown=quarkus:quarkus ./apache-maven-3.8.8 /opt/apache-maven-3.8.8
ENV M2_HOME=/opt/apache-maven-3.8.8
ENV PATH=$M2_HOME/bin:$PATH
USER quarkus
WORKDIR /code
COPY src /code/src
RUN mvn package -Dnative -DskipTests -Dquarkus.native.container-runtime=podman-rootless

# RUN mvn -B org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline
# docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# docker create --name dummy test
# docker cp dummy:/code/target /Users/tyyang/code-with-quarkus/
# docker rm -f dummy