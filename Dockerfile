FROM amazoncorretto:11-alpine3.17
LABEL author="pracy"
ARG USERNAME="petclinic"
ARG DOWNLOAD_LOCATION="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar"
ARG HOMEDIR="/petclinic"
RUN adduser -h/petclinic -s /bin/sh -D petclinic
USER ${USERNAME}
WORKDIR /petclinic
ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} "${HOMEDIR}/spring-petclinic-2.4.2.jar"
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-2.4.2.jar" ]
