# tekton-cicd

## Features

- Install Tekton along with Triggers, Webhook support and the dashboard
- Configures an eventlistener for Gitea
- Defines standard PR and Deploy pipelines

## Install

```sh
kubectl apply --recursive -f ./
```

## Custom Docker images used

### gitea-pr-state

`docker pull docker.cluster.fun/averagemarcus/gitea-pr-state:latest`

> Sets the state of a commit in Gitea. This is used to set the CI status to pending or success on the PR.

### ci-builder

`docker pull docker.cluster.fun/averagemarcus/ci-builder:latest`

> Used as a general-purpose Docker image with many common build tools included. This is used for running `make test` and `make build` without needing specific CI images for each project.

## Resources

- [Tekton](https://tekton.dev/)
- [Tekton Docs](https://tekton.dev/docs/)
