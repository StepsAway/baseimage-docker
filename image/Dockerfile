FROM ubuntu:14.04
LABEL maintainer="StepsAway <infra-ops@stepsaway.com>"

COPY . /bd_build
RUN /bd_build/install.sh

CMD ["/sbin/my_init"]
