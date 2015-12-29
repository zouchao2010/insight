#!/usr/bin/env bash

#copy livenet conf
if [ ! -d /var/lib/insight/livenet ]; then
    cp -r /opt/insight/livenet /var/lib/insight
    cp -r /opt/insight/node_modules /var/lib/insight/livenet
fi

#copy testnet conf
if [ ! -d /var/lib/insight/testnet ]; then
    cp -r /opt/insight/testnet /var/lib/insight
    cp -r /opt/insight/node_modules /var/lib/insight/testnet
fi

#run insight
if [ $TESTNET -eq 0 ];
then
    cd /var/lib/insight/livenet
    bitcore-node start
else
    cd /var/lib/insight/testnet
    bitcore-node start
fi
