FROM ubuntu:24.04

# Author label
LABEL maintainer="Yucheng Zhang <Yucheng.Zhang@tufts.edu>"

# Help message
LABEL description="This container contains code-server."

# Set environment variables
ENV PATH=/opt/code-server/bin:$PATH 

RUN cd /opt \
    && wget https://github.com/coder/code-server/releases/download/v4.98.2/code-server-4.98.2-linux-amd64.tar.gz \
    && tar -xvf code-server-4.98.2-linux-amd64.tar --one-top-level=code-server \
    && chmod +x code-server/bin/*
