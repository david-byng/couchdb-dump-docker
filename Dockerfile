FROM ubuntu:14.04
ADD couchdb-dump/ /couchdb-dump/
RUN chmod u+x /couchdb-dump/couchdb-backup.sh
RUN mkdir -p /dump
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ENV FILENAME dump.json
ENV FROMHOST from.docker
ENV FROMPORT 5984
ENV FROMDB exampledb
ENV TOHOST to.docker
ENV TOPORT 5984
ENV TODB exampledb

CMD /couchdb-dump/couchdb-backup.sh -b -f /dump/${FILENAME} -H ${FROMHOST} -P ${FROMPORT} -d ${FROMDB} && /couchdb-dump/couchdb-backup.sh -r -f /dump/${FILENAME} -H ${TOHOST} -P ${TOPORT} -d ${TODB}
