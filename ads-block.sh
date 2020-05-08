#!/bin/bash
rm hosts*
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts
echo "server:" > ads.conf
cat hosts | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 10.51.1.124\""}' >> ads.conf
cp ads.conf /etc/unbound/unbound.conf.d/ads.conf
service unbound restart
