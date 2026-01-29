FROM oven/bun:1.3.7

RUN apt-get update && \
    apt-get install -y openssh-server curl git awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "--- Verifying Tool Versions ---" && \
    ssh -V && \
    curl -V && \
    git --version && \
    bash --version && \
    bun --version && \
    aws --version && \
    echo "-------------------------------";

