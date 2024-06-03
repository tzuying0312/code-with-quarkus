FROM registry.access.redhat.com/ubi8/ubi
RUN curl -Ls https://sh.jbang.dev | bash -s - trust add https://repo1.maven.org/maven2/io/quarkus/quarkus-cli/ && \
    curl -Ls https://sh.jbang.dev | bash -s - app install --fresh --force quarkus@quarkusio
RUN yum install -y sudo && yum install -y podman

# RUN yum install -y wget unzip && \
#     cd /tmp && wget https://services.gradle.org/distributions/gradle-8.6-bin.zip && unzip gradle-*.zip && \
#     mkdir /opt/gradle && cp -pr gradle-*/* /opt/gradle && \
#     echo "export PATH=/opt/gradle/bin:${PATH}" | tee /etc/profile.d/gradle.sh && \
#     chmod +x /etc/profile.d/gradle.sh && \
#     source /etc/profile.d/gradle.sh

# quarkus build --native -Dquarkus.native.container-build=true -Dquarkus.native.container-runtime=podman -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-mandrel-builder-image:jdk-17