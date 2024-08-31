# Базовый образ для контейнера
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# Установка Go
ARG GO_VERSION=1.22.2
RUN curl -sSL "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" | tar -xz -C /usr/local
ENV PATH=/usr/local/go/bin:$PATH

# Установка Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

# Установка дополнительных инструментов и зависимостей
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  && apt-get clean

# Установка необходимых пакетов для разработки на Go, Rust и TypeScript
RUN go install golang.org/x/tools/gopls@latest
RUN rustup component add rust-analyzer

# Установка редактора кода и других инструментов
# (зависит от ваших требований)

COPY . /workspace

# Устанавливаем рабочую директорию
WORKDIR /workspace

# Открываем порты, если это необходимо
EXPOSE 3000 8080 5000

# Указываем команду запуска по умолчанию (при необходимости)
CMD ["sleep", "infinity"]
