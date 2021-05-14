# IP Juggling

## Story

You've read articles and watched videos about lots of things related to TCP/IP, the Internet, networks and all that, but did anything stick to you?

Nah, probably nut.

Your inner voice confirms this too and tells you something is missing ... **you've never actually got your hands dirty doing _something_ practical**.

You decided to do something about this and came up with a war plan!

## What are you going to learn?

- How to lookup your computer's private IP
- How to lookup your router's private IP
- How to lookup gateway IPs
- How to lookup your public IP
- How to lookup MAC addresses
- How to lookup network masks
- How to use `ping` and `traceroute`/`tracert` at a basic level
- Learn about the very basics of JSON

## Tasks

1. Note down and save your computer's network related attributes in `attributes.json` under the `computer` object.
    - `computer.private_ip` contains your computer's private IP, e.g. `"172.16.12.12"`
    - `computer.mac_address` contains the MAC address belonging to the network card having the private IP, e.g. `"F4-8C-50-B4-45-7E"`
    - `computer.network_id` contains the network ID of your private IP in CIDR notation, e.g. `"10.0.1.0/24"`
    - `computer.network_mask` contains the network mask belonging to your network ID, e.g. `"255.255.0.0"`
    - `computer.gateway_ip` contains the IP address of the default gateway configured on your computer, e.g. `"192.168.100.254"`
    - `computer.public_ip` contains the public IP, e.g. `"212.23.2.123"`

2. Besides having a computer we figure you also have some other network connected device at home, a smartphone, tablet or some other smart device. Record the same attributes for this device as you do with your computer in `attributes.json` under the `device` object.
    - `attributes.json` contains all data recorded for this other device just as for your computer, but under the keys starting with `device.`, e.g. `device.private_ip` would contain your device private IP address, etc.
    - `device.ping_ok` contains whether your computer could `ping` your other device via it's private IP or not, e.g. `true` if it worked, `false` otherwise
    - `device.traceroute_ok` contains whether your computer could `traceroute` your other device via it's private IP or not, e.g. `true` if it worked, `false` otherwise
    - `device.traceroute_hops` contains how many hops are between your computer and your other device, e.g. `32`

3. Note down your router's network related attributes in `attributes.json` under the `router` object and test the connection between your computer and your router/gateway.
    - `router.private_ip` contains your router's private IP address, e.g. `"172.16.12.12"`
    - `router.mac_address` contains the MAC address belonging to your router device, e.g. `"F4-8C-50-B4-45-7E"`
    - `router.gateway_ip` contains the IP address of the default gateway used by your router, e.g. `"192.168.100.254"`
    - `router.public_ip` contains the public IP, e.g. `"212.23.2.123"`
    - `router.ping_ok` contains whether your computer could `ping` the router via it's private IP or not, e.g. `true` if it worked, `false` otherwise
    - `router.traceroute_ok` contains whether your computer could `traceroute` the router via it's private IP or not, e.g. `true` if it worked, `false` otherwise
    - `router.traceroute_hops` contains how many hops are between your computer and router, e.g. `12`

4. Test your connectivity to the _World Wide Web_ by pinging and tracing `google.com` and record related information in `attributes.json` under the `google` object.
    - `google.public_ip` contains the public IP for the `google.com` domain, such as `"86.33.12.34"`
    - `google.ping_ok` contains whether your computer could `ping` Google's server at `google.com` or not, e.g. `true` if it worked, `false` otherwise
    - `google.traceroute_ok` contains whether your computer could `traceroute` Google server's at `google.com` or not, e.g. `true` if it worked, `false` otherwise
    - `google.traceroute_hops` contains how many hops are between your computer and Google's server at `google.com`, e.g. `42`

## General requirements

- `attributes.json` is a valid JSON document (validated via an online service or similar)

## Hints

- To be able to record some of the properties of your router you must be able to access its management interface using your browser (look up online how to access it for your own model), if you're not able to do this for some reason that's okay, don't worry about it
- Disable power saving mode on Android phones before trying to ping otherwise they won't respond to your ICMP echo requests
- JSON and YAML are both file formats that are often used for configuration files for various applications, especially YAML, but since YAML is based on JSON it's good to get familiar with it at a basic level
- **When you are reading background materials:**
  - [JSON Tutorial](https://www.youtube.com/watch?v=iiADhChRriM)
    - The part related to JavaScript is not important right, just focus on the format/syntax
    - Make sure you understand where to put curly braces (`{` and `}`), brackets (`[` and `]`), double quotes (`"`) and the like
  - [How to Find the IP of Your Android/iPhone](https://www.makeuseof.com/tag/find-ip-address-mobile-smartphone/)
    - Read the _How To Find Your Mobile IP Address_ section

## Starting your project



## Background materials

- [Online JSON validator](https://jsonlint.com/)
- [JSON Tutorial](https://www.youtube.com/watch?v=iiADhChRriM)
- [JSON in 5 minutes](https://learnxinyminutes.com/docs/json/)
- [CIDR notation example](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation)
- <i class="far fa-exclamtion"></i> [Introduction to TCP/IP](project/curriculum/materials/pages/networks/introduction-to-tcp-ip.md)
- [How to Find the IP of Your Android/iPhone](https://www.makeuseof.com/tag/find-ip-address-mobile-smartphone/)
- [How to Find Your Router’s IP Address on Any Computer, Smartphone, or Tablet](https://www.howtogeek.com/233952/how-to-find-your-routers-ip-address-on-any-computer-smartphone-or-tablet/)
