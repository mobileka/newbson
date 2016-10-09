"Newbson" comes from "Newbie + JSON".

This library makes reading and deserializing local JSON files with pure Swift easy.

## Installation

*Will be added soon*

## Usage

*Let me try it myself and I'll tell you how ;)*

## Why

As a person coming from PHP, Ruby, JavaScript and other dynamically typed languages, I find reading and deserializing local JSON files in Swift difficult.

Generally, it requires four steps:

1. Read a file as a `String`
2. Convert it to an array of bytes `[UInt8]`
3. Convert the array to `Data`
4. And finaly deserialize it

Another problem is related to the current position of Swift: it's being mainly used for iOS and Mac development, so sometimes it's hard to find answers working equally well on Mac and Linux platforms.

All the above makes a simple task of JSON handling hard for newbies like me.

I wanted to make it as simple as in dynamically typed languages and make lives of fellow newbies a little bit easier :)

## License

Newbson is an open-source software and licensed under the [MIT License](https://github.com/mobileka/newbson/blob/master/license).