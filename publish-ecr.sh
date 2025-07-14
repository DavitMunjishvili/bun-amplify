aws ecr-public get-login-password --region us-east-1 --profile [[[[[[[AQ CHAWERET PROFILI]]]]]]] --no-cli-auto-prompt | docker login --username AWS --password-stdin public.ecr.aws
docker buildx build --platform linux/arm64,linux/amd64 -t public.ecr.aws/w1j4x5s1/impel/bun-amplify .
docker push public.ecr.aws/w1j4x5s1/impel/bun-amplify:latest
