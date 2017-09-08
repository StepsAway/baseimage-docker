FROM ubuntu:16.04
MAINTAINER StepsAway <infra-ops@stepsaway.com>

COPY . /bd_build

# NOTE: pam_bug fix is moved betfore the utilities install to ensure the
# removal of the build dependancies to not also remove a package we want to install.
RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/fix_pam_bug.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["/sbin/my_init"]
