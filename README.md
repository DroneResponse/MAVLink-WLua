# MAVLink WLUA generator

A docker image to generate the mavlink plugin for wireshark

## Usage
How to use this:
```bash
docker build . -t mavlink-wireshark

mkdir out
docker run -it -v ./out:/out mavlink-wireshark python3 -m pymavlink.tools.mavgen --lang=WLua --wire-protocol=2.0 --output=/out/mavlink_2_common message_definitions/v1.0/common.xml
```

## Work-Around

wireshark might not accept the WLua plugin. You might see this error:

```
Lua: Error during loading:
$HOME/.local/lib/wireshark/plugins/mavlink_2_common.lua:6698: bad argument #5 to 'new' (ProtoField_new: Base must be either base.DEC or base.UNIT_STRING)
stack traceback:
[C]: in field 'new'
$HOME/.local/lib/wireshark/plugins/mavlink_2_common.lua:6698: in main chunk
[C]: in function 'require'
```

If that happens you might need to go to the line number and change the lua file. You want to change `base.HEX_DEC` to `base.DEC` for this field.

Note that the file `out/mavlink_2_common.lua` that was commited to this repo includes this fix.

