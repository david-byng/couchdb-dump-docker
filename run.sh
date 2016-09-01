#!/bin/bash

if [ -z $NODUMP ]; then
    /couchdb-dump/couchdb-backup.sh -b -f /dump/${FILENAME} -H ${FROMHOST} -P ${FROMPORT} -d ${FROMDB} || exit 1;
fi;

if [ -z $NOIMPORT ]; then
    /couchdb-dump/couchdb-backup.sh -r -f /dump/${FILENAME} -H ${TOHOST} -P ${TOPORT} -d ${TODB} || exit 1;
fi;
