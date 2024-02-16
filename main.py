#!/usr/bin/env python3
import sys
import time
import paho.mqtt.client as paho
import datetime

while True:

    broker = sys.argv[1]
    broker_username = sys.argv[2]
    broker_password = sys.argv[3]
    topic = "{0}/{1}".format(sys.argv[4],sys.argv[5])

    client = paho.Client(paho.CallbackAPIVersion.VERSION1, sys.argv[5])
    client.username_pw_set(broker_username, broker_password)
    print("Connecting to broker {0} as {1}".format(broker, broker_username))
    client.connect(broker)
    print("publishing...")

    message = '{{"timestamp": "{0}"}}'.format(datetime.datetime.now())

    print(message)
    client.publish(topic, message)
    print("Disconnecting...")
    client.disconnect()

    time.sleep(int(sys.argv[6]))
    
