FROM jenkins/jenkins:lts
USER root
ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install --no-install-recommends -y apt-utils 2> >( grep -v 'debconf: delaying package configuration, since apt-utils is not installed' >&2 )
RUN apt-get install --no-install-recommends gnupg curl ca-certificates apt-transport-https -y
RUN curl -sSfL https://apt.octopus.com/public.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
RUN sh -c "echo deb https://apt.octopus.com/ stable main > /etc/apt/sources.list.d/octopus.com.list"
RUN apt-get update
RUN apt-get install octopuscli -y
RUN octo --version
