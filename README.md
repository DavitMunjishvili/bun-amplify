# Bun Amplify

> **Docker image for Bun with AWS CLI, Git, and SSH pre-installed. Optimized for CI/CD deployments to AWS Amplify.**

[![Docker Pulls](https://img.shields.io/docker/pulls/davitmunjishvili/bun-amplify)](https://hub.docker.com/r/davitmunjishvili/bun-amplify)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

This image provides a "batteries-included" runtime for deploying Bun applications using AWS. It solves the common problem of needing both the Bun runtime and AWS CLI tools in the same CI/CD pipeline step.

**Key Features:**
*   **Bun 1.3.7:** The latest fast JavaScript runtime.
*   **AWS CLI v2:** Pre-installed and configured for deployment scripts.
*   **Utilities:** Includes `git`, `ssh`, `curl`, and `bash`.
*   **CI/CD Ready:** Fixed entrypoint to allow execution of standard shell commands (e.g., `aws`, `npm`, `bun`).

## Software Bill of Materials

*   `oven/bun:1.3.7` (Base Image)
*   `aws-cli` (Latest v2)
*   `git`
*   `openssh-server`
*   `curl`

## Usage

### Local Development

```bash
docker run -it davitmunjishvili/bun-amplify:latest bash
# Inside container:
bun --version
aws --version
```

### Bitbucket Pipelines Example

```yaml
image: davitmunjishvili/bun-amplify:latest

pipelines:
  default:
    - step:
        name: Deploy to AWS Amplify
        script:
          - bun install
          - bun run build
          - aws amplify start-job --app-id <APP_ID> --branch-name <BRANCH> --job-type RELEASE
```

### GitHub Actions Example

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    container: davitmunjishvili/bun-amplify:latest
    steps:
      - uses: actions/checkout@v3
      - run: bun install
      - run: bun run build
      - run: aws s3 sync dist/ s3://my-bucket
```

## License

MIT
