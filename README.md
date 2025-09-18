# MAVLink WLUA generator

A docker image to generate the mavlink plugin for wireshark

## Usage
How to use this:
```bash
docker build . -t mavlink-wireshark

mkdir out
docker run -it -v ./out:/out mavlink-wireshark python3 -m pymavlink.tools.mavgen --lang=WLua --wire-protocol=2.0 --output=/out/mavlink_2_common message_definitions/v1.0/common.xml
```