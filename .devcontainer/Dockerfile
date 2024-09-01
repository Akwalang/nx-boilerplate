FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  && apt-get clean

COPY . /workspace

WORKDIR /workspace

EXPOSE 3000 8080 5000

CMD ["sleep", "infinity"]
