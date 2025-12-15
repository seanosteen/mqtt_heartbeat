FROM python:alpine3.22

RUN apk update && apk upgrade

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir paho-mqtt

ARG UID=1001
ARG GID=1001

RUN addgroup -g $GID appgroup && \
    adduser -u $UID -G appgroup -D appuser

WORKDIR /home/appuser/app

COPY --chown=appuser:appgroup main.py /home/appuser/app/

USER appuser

CMD ["sh", "-c", "python /home/appuser/app/main.py $MQTT_HOST $MQTT_USERNAME $MQTT_PASSWORD $MQTT_TOPIC $HOSTNAME $HEARTBEAT_INTERVAL"]
