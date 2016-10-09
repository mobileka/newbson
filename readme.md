"Newbson" comes from "Newbie + JSON".

This library makes reading and deserializing local JSON files with pure Swift easy.

## Table of contents

- [Installation](#installation)
- [Usage](#usage)
- [Why](#why)
- [License](#license)

## Installation

Add the following line to your `Package.swift` dependencies:

`.Package(url: "https://github.com/mobileka/newbson.git", majorVersion: 1, minor: 0),`

Run `swift build`.

## Usage

```
let newbson = Newbson(path: "path/to/json/file.json")

do {
	let json = try newbson.read()
} catch {
	// oops, it wasn't able to read the file
}
```

Now you have `Any?` in your `json` constant.

To be able to access the contents of your JSON, you have to cast it to a native Swift data structure.

* If your JSON is something like this:

`{"some" : "value"}`

then it has to be a dictionary with keys and values of the `String` type:

`let json = try newbson.read() as! [String : String]`

* If JSON looks like this:

`[1, 2, 3]`

then it has to be an array of integers:

`let json = try newbson.read() as! [Int]`

* JSON: `[1, 2, "three"]` -> `as! [Any]`

* JSON: `{"string": "I'm a string", "int": 1}` -> `as! [String : Any]`

I hope you got the idea.

But what to do when you don't know what is the structure of your JSON?

In this case you have to cast it with `?` sign instead of `!` and check the result:

```
if let json = try newbson.read() as? [String : String] {
	// it's a dictionary with keys and values of the `String` type
	if let value = json["key"] {
		// sweet, you did it, you have your String value
	}
} else if let json = try newbson.read() as? [String : Any] {
	// it's a dictionary
	if let value = json["key"] {
		if value is String {
			// you have a String
		} else if value is Int {
			// you get the idea
		}
	}
} else if let json = try newbson.read() as? [Any] {
	// it's an array
} else {
	// what the hell is it?!
}
```

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