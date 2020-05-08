#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

wget -O /tmp/root.hints https://www.internic.net/domain/named.root
mv /tmp/root.hints /var/lib/unbound/
service unbound reload
