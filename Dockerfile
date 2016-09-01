FROM ubuntu:14.04
ADD couchdb-dump/ /couchdb-dump/
RUN chmod u+x /couchdb-dump/couchdb-backup.sh
RUN mkdir -p /dump

ENV FILENAME dump.json
ENV FROMHOST from.docker
ENV FROMPORT 80
ENV FROMDB exampledb
ENV TOHOST to.docker
ENV TOPORT 80
ENV TODB exampledb

CMD /couchdb-dump/couchdb-backup.sh -b -f /dump/${FILENAME} -H ${FROMDB} -P ${FROMPORT} -d ${FROMDB} && /couchdb-dump/couchdb-backup.sh -r -f /dump/${FILENAME} -H ${TOHOST} -P ${TOPORT} -d ${TODB}
