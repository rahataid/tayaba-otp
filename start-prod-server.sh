#! /bin/bash
  
while true
do
response=$(curl --max-time 15 --write-out %{http_code} --silent --output /dev/null https://tayaba-api.xa.rahat.io/api/v1/settings)
# ((i++))
    if [ "$response" = "200" ]; then
        echo "rahat server is ready";
        yarn production;
        break;
    else
        echo "rahat server is not ready";
        sleep 5;
    fi
done
