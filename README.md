
# MQTT Heartbeat

This is a simple python-based script, runnning in a container that will publish an updated timestamp and a system uptime value to an MQTT topic of your choice.

## Docker Command:

~~~
docker run -d \
   -e MQTT_HOST=<CHANGE_ME> \
   -e MQTT_USERNAME=<CHANGE_ME> \
   -e MQTT_PASSWORD=<CHANGE_ME> \
   -e MQTT_TOPIC=Docker/Heartbeats" \
   -e HEARTBEAT_INTERVAL=30 \
   --name mqtt_heartbeat \
   --restart unless-stopped \
   -h <SETHOSTNAMEHERE> \
   seanosteen/mqtt_heartbeat
~~~
