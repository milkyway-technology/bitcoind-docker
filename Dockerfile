FROM alpine:3.19 AS build

ARG BITCOIND_VERSION="master"

WORKDIR /app

RUN apk update && apk add --no-cache \
    alpine-sdk \
    autoconf \
    automake \
    boost-dev \
    libevent-dev \
    libressl \
    libtool \
    sqlite-dev \
    zeromq-dev

RUN git clone --depth 1 --branch $BITCOIND_VERSION https://github.com/bitcoin/bitcoin

RUN cd bitcoin && \
    ./autogen.sh && \
    ./configure \
    --prefix=/app/bitcoin \
    --disable-bench \
    --disable-ccache \
    --disable-tests \
    --with-gui=no \
    --with-sqlite=yes && \
    make -j4 && \
    make install && \
    strip /app/bitcoin/bin/*

FROM alpine:3.19

ARG UID="1001"
ARG GID="1001"

ENV DB_CACHE="450"
ENV MAX_MEM_POOL="300"
ENV MAX_ORPHAN_TX="100"
ENV PRUNE="0"
ENV MAX_CONNECTIONS="125"
ENV MAX_UPLOAD_TARGET="0"
ENV CHAIN="main"
ENV RPC_ALLOW_IP=""
ENV RPC_BIND="127.0.0.1"
ENV RPC_PASSWORD=""
ENV RPC_USER=""
ENV RPC_ENABLED="0"

WORKDIR /app

RUN apk update && apk add --no-cache \
    gettext \
    libevent \
    libzmq \
    sqlite-dev

RUN addgroup -g $GID bitcoind && adduser -u $UID -G bitcoind -D bitcoind

RUN mkdir /app/config && \
    mkdir /app/data && \
    chown bitcoind:bitcoind /app/config && \
    chown bitcoind:bitcoind /app/data

COPY --from=build /app/bitcoin/bin /usr/local/bin

COPY --chown=bitcoind:bitcoind config/bitcoin.conf /app/config

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8332 8333

VOLUME /app/data

USER bitcoind

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["bitcoind", "-conf=/app/config/bitcoin.conf", "-datadir=/app/data"]
