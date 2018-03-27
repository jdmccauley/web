FROM bitwarden/server

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gosu \
&& rm -rf /var/lib/apt/lists/*

ENV ASPNETCORE_URLS http://+:5000
WORKDIR /app
EXPOSE 5000
COPY ./dist .
COPY entrypoint.sh /

RUN groupadd -g 999 bitwarden \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
