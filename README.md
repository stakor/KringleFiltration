# KringleFiltration

### Blog Post:
Coming Soon...

### Creator:
Chris Stakor

### What is KringleFiltration?

Kringlefiltration is a holiday mutation of the LolFiltration tool. It too will allow for the evasion of DLP looking for Base64. 

### How Does it work?
Payload -> Base64

Base64 -> KringleFiltration

KringleFiltration - > base64

As you were…

### Usage:

Use Wrapper Script to encode the file:

`KringleFiltration.sh <binary>`

Use Wrapper script to decode the file:

`KringleFiltration.sh -d <name>.lol`

*or*

For just the conversion process:

`core_lol.py <input.64> <output.kringle>`

To extract:

`core_lol.py -d <input.kringle> <output.file>`

### Example:
![alt text](https://github.com/stakor/img/blob/master/kringlefiltration-s.png "KringleFiltration")
