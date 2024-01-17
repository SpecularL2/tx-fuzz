#!/bin/sh

cd /

./livefuzzer spam --sk `cat /tmp/validator_pk.txt` --rpc "http://$SP_GETH_SERVICE_HOST:$SP_GETH_SERVICE_PORT_4011" --txcount 2

