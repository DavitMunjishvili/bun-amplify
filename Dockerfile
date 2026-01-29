FROM oven/bun:1.3.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server curl git awscli && \
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

# Reset entrypoint to allow arbitrary commands (required for AWS Amplify/CI)
ENTRYPOINT []
CMD ["/bin/bash"]
LABEL org.opencontainers.image.source="https://github.com/DavitMunjishvili/bun-amplify"
LABEL org.opencontainers.image.description="Docker image for Bun with AWS CLI, Git, and SSH pre-installed. Optimized for CI/CD deployments to AWS Amplify."
LABEL org.opencontainers.image.licenses="MIT"
