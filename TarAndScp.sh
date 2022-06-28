#!/usr/bin/sh

#ip new
ip="xxx.xxx.xx.x"
#Chat ID Telegram
ID="XXXXXX"
#Bot Token
TOKEN="XXXXXX"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"


for i in *
    do  
        if [ ! -e "cpmove-$i.tar.gz"  ]; then
            tar -zcvf cpmove-$i.tar.gz -C $i $(find ./$i ! -path . -type d | sort -nr | head -1 | cut -d '/' -f3); 
            scp cpmove-$i.tar.gz root@$ip:/home
            RESULT=$?
            if [ $RESULT -eq 0 ]; then
                curl -s -X POST $URL -d chat_id=$ID -d text="The backup account $i was successfully transferred to new server, please restore the account from WHM" > /dev/null 2>&1
            else
                echo file sudah ada
            fi
        fi
    done
