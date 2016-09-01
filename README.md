# couchdb-dump
Runs [couchdb-dump.sh](https://github.com/danielebailo/couchdb-dump) in a docker container for
portability.

## How to use

The default command is:

```
/couchdb-dump/couchdb-backup.sh -b -f /dump/${FILENAME} -H ${FROMHOST} -P ${FROMPORT} -d ${FROMDB} && \
/couchdb-dump/couchdb-backup.sh -r -f /dump/${FILENAME} -H ${TOHOST} -P ${TOPORT} -d ${TODB}
```

So to run a sync between two dbs you could:

```
docker run \
    -e "FROMHOST=\"http://from.example.com\"" \
    -e "FROMDB=exampledb" \
    -e "TOHOST=\"http://to.example.com\"" \
    -e "TODB=exampledb" \
    couchdb-dump-docker
```

or

```
docker run \
    --link existing_container:from.docker \
    --link another_container:to.db \
    -e "FROMDB=foo" \
    -e "TODB=bar" \
    couchdb-dump-docker
```

Defaults:

| Name | Default |
| ---- | ------- |
| FILENAME| dump.json |
| FROMHOST | from.docker |
| FROMPORT | 5984 |
| FROMDB | exampledb |
| TOHOST | to.docker |
| TOPORT | 5984 |
| TODB | exampledb |
