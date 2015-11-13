FROM node:0.10

ENV VERSION 0.2.1

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

#RUN touch /root/.npmrc \
#    && echo registry=https://registry.npm.taobao.org >> /root/.npmrc

#install insight
RUN wget https://github.com/bitpay/insight/archive/v$VERSION.tar.gz \
    && tar -zxvf v$VERSION.tar.gz \
    && rm -rf v$VERSION.tar.gz \
    && mv insight-$VERSION insight \
    && cd insight \
    && npm install

#install insight-api
RUN cd insight/node_modules \
    && wget https://github.com/bitpay/insight-api/archive/v$VERSION.tar.gz \
    && tar -zxvf v$VERSION.tar.gz \
    && rm -rf v$VERSION.tar.gz \
    && mv insight-api-$VERSION insight-api \
    && cd insight-api \
    && npm install

#replace insight-bitcore-api
RUN cd insight/node_modules \
    && rm -rf insight-bitcore-api \
    && mv insight-api insight-bitcore-api \
    && cd .bin \
    && rm  insight-bitcore-api \
    && ln -s ../insight-bitcore-api/insight.js insight-bitcore-api

WORKDIR /opt/insight

VOLUME /var/lib/insight/data


# production|test|development
ENV NODE_ENV                        development
ENV BITCOIND_HOST                   127.0.0.1
ENV BITCOIND_P2P_HOST               127.0.0.1
ENV BITCOIND_USER                   user
ENV BITCOIND_PASS                   pass
ENV BITCOIND_DATADIR                /var/lib/insight/data/bitcoind

# livenet|testnet
ENV INSIGHT_NETWORK                 testnet
ENV INSIGHT_PORT                    3000
ENV INSIGHT_DB                      /var/lib/insight/data/db
ENV INSIGHT_SAFE_CONFIRMATIONS      6
ENV INSIGHT_IGNORE_CACHE            0
ENV INSIGHT_FORCE_RPC_SYNC          0
ENV ENABLE_CURRENCYRATES            true
ENV ENABLE_RATELIMITER              true
ENV LOGGER_LEVEL                    info
ENV ENABLE_HTTPS                    false
ENV ENABLE_EMAILSTORE               true
ENV INSIGHT_EMAIL_CONFIRM_HOST      https://insight.bitpay.com


WORKDIR /opt/insight

EXPOSE 3000
CMD ["npm", "start"]
