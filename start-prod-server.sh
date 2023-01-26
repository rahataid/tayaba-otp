#! /bin/bash
 
while true
do
# ((i++))
    if curl -If "http://tayaba:4800/api/v1/settings"; then
        echo "rahat server is ready";
        yarn production;
        break;
    else
        echo "rahat server is not ready";
        sleep 5;
    fi
done