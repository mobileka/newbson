"Newbson" comes from "Newbie + JSON".

This library makes reading and deserializing local JSON files with pure Swift [relatively] easy.

## Table of contents

- [Installation](#installation)
- [Usage](#usage)
- [Why?](#why)
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
} catch e as NewbsonError.fileNotFound(let path) {
	// oops, it wasn't able to read the file
	// you can examine the "path" variable for additional information
}
```

Now you have `Any?` in your `json` constant.

To be able to access contents of your JSON, you have to cast it to a native Swift data structure.

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

But what if don't know the structure of the JSON?

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

You can also do the following:

```
// get file contents as `Data`
if let jsonData = newbson.getData() {
	// you have it
}
```

It can be useful because other JSON libraries nostly work with the above data type

## Why?

I've originally created this library because I just started learning Swift and I didn't know the shortest way to read a local JSON file at that moment.

Another problem is related to the current position of Swift: it's being mainly used for iOS and Mac development, so sometimes it's hard to find answers working equally well on Mac and Linux platforms.

I still believe that this library provides a cleaner API, so it's still can be useful sometimes. It's also useful for newbies as a source of documentation and a simple example of testing with XCTest and AAA methodology (when possible).

## License

Newbson is an open-source software and licensed under the [MIT License](https://github.com/mobileka/newbson/blob/master/license).