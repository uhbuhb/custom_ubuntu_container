FROM ubuntu:18.04
LABEL maintainer="habermanori@gmail.com"

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    python3-setuptools \
    vim \
    sudo \
    curl \
    wget \
    gnupg2 \
    gnupg-agent \
    iputils-ping

RUN ln -s /usr/bin/python3 /usr/local/bin/python && \
    ln -s /usr/bin/pip3 /usr/local/bin/pip

RUN pip install --upgrade pip

RUN apt-get install -y apt-transport-https \
    ca-certificates \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN  apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
