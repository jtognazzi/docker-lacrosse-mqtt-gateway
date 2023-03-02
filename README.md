# Dockerized Lacrosse Sensor MQTT Client/Daemon/Gateway

This is a dockerized version of the Python script to include Lacrosse Sensors using a Jeelink into an **MQTT** broker and Homeassistant.


## About Lacrosse / Jeelink

* [Jeelink USB Stick](https://www.digitalsmarties.net/products/jeelink)
* [pylacrosse](https://github.com/hthiery/python-lacrosse)
* [Summary on Sensors](https://wiki.fhem.de/wiki/JeeLink#LaCrosse_Sketch)

## Features

* Highly configurable
* Data publication via MQTT
* [HomeAssistant MQTT discovery format](https://home-assistant.io/docs/mqtt/discovery/)
* MQTT authentication support
* No special/root privileges needed
* Linux daemon / systemd service, sd\_notify messages generated


### Readings

The Lacrosse sensors offer the following readings:

| Name            | Description |
|-----------------|-------------|
| `temperature`   | Air temperature, in [°C] (0.1°C resolution |
| `humidity`      | Humidity, in [%] |
| `battery`       | Lacrosse Sensors only provide a low battery warning, therefor you'll only see 100% and 0% here |

## Prerequisites

An MQTT broker is needed as the counterpart for this daemon.

## Installation

Docker and Compose are required to get up and running. The setup is relatively straightforward.
The only line which *must* be adapted is the following:

      - /dev/serial/by-id/usb-FTDI_FT232R_USB_UART_D8JKU78H-if33-port0:/dev/ttyUSB0

Use `ls -la /dev/serial/by-id/` to find out the correct id to insert into the docker-compose.yml file.

After creating/updating the configuration file (see below) the docker service can be started using
```
docker compose up -d
```
Follow the logs using
```
docker compose logs -f
```

## Configuration

To match personal needs, all operation details can be configured using the file [`config.ini`](config.ini.dist).
The file needs to be created first based on the included example.

**Attention:**
You need to add at least one sensor to the configuration.
Scan for available Lacrosse sensors in your proximity with the command:

## Execution

# Acknowledgement

This work is based on the lacrosse-mqtt-gateway by [Alex Muthmann](https://github.com/deveth0/lacrosse-mqtt-gateway) which in turn is based on the great work done by [Thomas Dietrich](https://github.com/ThomDietrich) in his [miflora-mqtt-daemon](https://github.com/ThomDietrich/miflora-mqtt-daemon).
