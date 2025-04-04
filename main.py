#!/usr/bin/env python3
import sys
import time
import paho.mqtt.client as paho
import datetime

startTime = datetime.datetime.now()

while True:

    broker = sys.argv[1]
    broker_username = sys.argv[2]
    broker_password = sys.argv[3]
    topic = "{0}/{1}".format(sys.argv[4],sys.argv[5])
    hostname = sys.argv[5]

    client = paho.Client(paho.CallbackAPIVersion.VERSION2, sys.argv[5])
    client.username_pw_set(broker_username, broker_password)
    print("Connecting to broker {0} as {1}".format(broker, broker_username))
    client.connect(broker)
    print("publishing:")
    uptime = datetime.datetime.now() - startTime
    message = '{{"timestamp": "{0}", "uptime":"{1}", "hostname": "{2}"}}'.format(datetime.datetime.now(), uptime, hostname)

    print(message)
    client.publish(topic, message)
    print("Disconnecting...")
    client.disconnect()

    time.sleep(int(sys.argv[6]))
    
