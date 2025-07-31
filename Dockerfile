# A dockerfile must always start by importing the base image.
# We use the keyword 'FROM' to do that.
# In our example, we want import the python image.
# So we write 'python' for the image name and 'latest' for the version.
FROM python:latest

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir paho-mqtt

ARG UID=1001
ARG GID=1001

RUN groupadd --gid $GID appgroup && \
    useradd --uid $UID --gid $GID -m appuser

WORKDIR /home/appuser/app


COPY --chown=appuser:appgroup main.py /home/appuser/app/

# We need to define the command to launch when we are going to run the image.
# We use the keyword 'CMD' to do that.
# The following command will execute "python ./main.py".
CMD ["sh", "-c", "python /home/appuser/app/main.py $MQTT_HOST $MQTT_USERNAME $MQTT_PASSWORD $MQTT_TOPIC $HOSTNAME $HEARTBEAT_INTERVAL"]

