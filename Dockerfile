FROM java:8

ENV GRAILS_VERSION 3.2.8

RUN apt-get update -qq && apt-get install -y -qq curl unzip zip
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -l -c "sdk install grails $GRAILS_VERSION"

ENV PATH $PATH:/root/.sdkman/candidates/grails/current/bin/

