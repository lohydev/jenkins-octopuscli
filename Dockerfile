FROM jenkins/jenkins:lts
USER root

RUN apt install --no-install-recommends gnupg curl ca-certificates apt-transport-https
RUN curl -sSfL https://apt.octopus.com/public.key | apt-key add -
RUN sh -c "echo deb https://apt.octopus.com/ stable main > /etc/apt/sources.list.d/octopus.com.list"
RUN apt update
RUN apt install octopuscli -y
RUN octo --version
