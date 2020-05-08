#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
rm /tmp/hosts*
wget -O /tmp/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts
echo "server:" > /tmp/ads.conf
cat hosts | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 10.51.1.124\""}' >> /tmp/ads.conf
cp /tmp/ads.conf /etc/unbound/unbound.conf.d/ads.conf
service unbound restart
