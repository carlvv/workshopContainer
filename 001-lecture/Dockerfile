FROM debian:12
LABEL com.example.workshop="0.0.1-beta"

RUN apt update \
    && apt install -y curl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["curl -s https://www.hamburg.de/"]
