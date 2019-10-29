#FROM adoptopenjdk/openjdk11-openj9:jdk-11.0.1.13-alpine-slim
#COPY build/libs/micronaut-kotlin-graalvm-*-all.jar micronaut-kotlin-graalvm.jar
#EXPOSE 8080
#CMD java -Dcom.sun.management.jmxremote -noverify ${JAVA_OPTS} -jar micronaut-kotlin-graalvm.jar

# GRAALVM CONFIG

FROM oracle/graalvm-ce:19.2.0 as graalvm
COPY . /home/app/micronaut-kotlin-graalvm
WORKDIR /home/app/micronaut-kotlin-graalvm
RUN gu install native-image
RUN native-image --version
RUN native-image -cp build/libs/micronaut-kotlin-graalvm*-all.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-kotlin-graalvm .
CMD ["./micronaut-kotlin-graalvm"]