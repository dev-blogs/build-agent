FROM ubuntu:16.04

EXPOSE 8080

COPY sources.list /etc/apt

COPY oc_3_6_1/oc /usr/bin/oc
COPY oc/kubectl /usr/bin/kubectl

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y lsb-release
RUN apt-get install -y software-properties-common
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y maven
RUN apt-get install -y git

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update
RUN apt-get install -y docker-ce

RUN mkdir -p ~/.ssh
RUN ssh-keyscan -t ecdsa github.com >> ~/.ssh/known_hosts
