FROM weaveworksdemos/msd-java:jre-latest

WORKDIR /usr/src/app
COPY target/*.jar ./app.jar
COPY ./newrelic/newrelic.jar ./newrelic.jar

RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar
RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./newrelic.jar

USER ${SERVICE_USER}

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]

