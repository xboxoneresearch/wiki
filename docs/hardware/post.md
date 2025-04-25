# POST

[POST](https://en.wikipedia.org/wiki/Power-on_self-test) codes on Xbox are sent by the southbridge via I2C to an *optional* MAX6958 IC to be displayed via 4x 7-Segment-Displays.

I2C Address: *0x38*

f.e. I2C SDA/SCL pads from [FACET connector](./facet.md) or [RF Unit](./rf-unit.md) can be used.

![7Segment Displays](../_files/post/7_seg_lighted.jpg)

## Schematic

![MAX6958 schematic](../_files/post/max6958_7seg_schematic.png)

## POST Codes

| Code   | Name         | Description |
| ------ | ------------ | ----------- |
| 0x0075 | Boot success |             |
| 0x14FF | Boot success |             |

## Reading POST codes

There is a minimalistic POST monitor implemented via Raspberry Pi Pico.
It simulates the MAX6958A I2C Slave and displays the gathered POST-codes via USB serial.

Soldering 3 wires (I2C and GND) is necessary.

See [Tools - PicoDurangoPOST](#tools)

![POST monitor](../_files/post/postmonitor_serial.png)

## Tools

- [PicoDurangoPOST](https://github.com/xboxoneresearch/PicoDurangoPOST)

## References

- [MAX6958 Datasheet](https://www.analog.com/en/products/max6958.html)
- [MAX6958 Display module](https://oshwlab.com/marten_7544/max6958) - Open source design by Martin Feldtmann