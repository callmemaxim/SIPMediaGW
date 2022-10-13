#!/bin/bash

touch `pwd`/kamailio.sqlite
docker run -it -v `pwd`/kamailio.sqlite:/usr/local/etc/kamailio/kamailio.sqlite -v `pwd`/kamailio:/etc/kamailio:ro --entrypoint kamdbctl  kamailio4sipmediagw  create
docker run -it -v `pwd`/kamailio.sqlite:/usr/local/etc/kamailio/kamailio.sqlite -v `pwd`/kamailio:/etc/kamailio:ro --entrypoint  sqlite3  kamailio4sipmediagw /usr/local/etc/kamailio/kamailio.sqlite "alter table location add column locked INTEGER NOT NULL DEFAULT 0"
