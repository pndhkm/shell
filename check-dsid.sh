#!/bin/bash
# check-dsid.sh yourdomain.com

domain=$@

echo "DS Record - $domain" $'\n'
for resolver in b.dns.id. c.dns.id. d.dns.id. e.dns.id. ns4.apnic.net.
 do
   if [ -z $(dig @${resolver} $domain DS +short | awk '{print $4}') ]
        then
                echo ${resolver} $'\t' 'Not Found'
        else
                echo -n  ${resolver} $'\t' ; dig @${resolver} $domain DS +short
   fi

 done
