ARG BASE=debian:bullseye
FROM ${BASE}
ARG ARCH=x86_64
ARG S6_OVERLAY_VERSION=3.1.6.2

RUN apt-get update && apt-get install -y xz-utils && rm -rf /var/lib/apt/lists/*

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${ARCH}.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-${ARCH}.tar.xz
ENTRYPOINT ["/init"]
