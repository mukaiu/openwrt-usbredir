# Usbredir for OpenWrt

usbredir is a protocol for redirection USB traffic from a single USB device, to a different (virtual) machine then the one to which the USB device is attached. See usb-redirection-protocol.md for the description / definition of this protocol.

This package contains a number of libraries to help implementing support for usbredir and a few simple usbredir applications:

## usbredirparser:
A library containing the parser for the usbredir protocol

## usbredirhost:
A library implementing the usb-host (*) side of a usbredir connection.
All that an application wishing to implement an usb-host needs to do is:
* Provide a libusb device handle for the device
* Provide write and read callbacks for the actual transport of usbredir data
* Monitor for usbredir and libusb read/write events and call their handlers

*) The side to which the actual USB device is attached, also see the
definitions section in usb-redirection-protocol.txt

## usbredirserver:
A simple tcp server usb-host, using usbredirhost
