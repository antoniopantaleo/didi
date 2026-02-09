# Didi

<img align="right" height="350" alt="image-no-bg" src="Sources/Didi/Documentation.docc/Resources/logo.png" />

[![Swift 6.2](https://img.shields.io/badge/Swift-6.2-orange.svg)](https://swift.org)
[![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-6DB33F.svg)](https://www.swift.org/package-manager/)

![Platform macOS](https://img.shields.io/badge/platform-macOS%2010.13%2B-lightgrey.svg)
![Platform iOS](https://img.shields.io/badge/platform-iOS%2012%2B-lightgrey.svg)
![Platform tvOS](https://img.shields.io/badge/platform-tvOS%2012%2B-lightgrey.svg)
![Platform watchOS](https://img.shields.io/badge/platform-watchOS%202%2B-lightgrey.svg)
![Platform visionOS](https://img.shields.io/badge/platform-visionOS%201%2B-lightgrey.svg)

`didi` (pronounced _/diː diː/_ or _dee dee_) is a dependency injection abstracion layer, written with dependency inversion in mind.

It leverages powerful Swift features like _result builders_, _property wrappers_, _operators_ and _parameter packs_ to offer a robust, friendly and compile-time safe API.

> [!IMPORTANT] 
> 
> `didi` is NOT a dependency injection framework

## Architecture

```mermaid
sequenceDiagram
    actor Client as Your App
    participant Container as Container
    box Gray Adapters
      participant DI as DI Framework
    end

    note over Container,DI: boundary
    Client ->> Container: register(type, factory)
    Container -->> DI: register()

    Client ->>+ Container: resolve(type)
    Container -->> DI: resolve()
    DI -->> Container: service
    Container ->- Client: service
```


## Installation

### Swift Package Manager

Add `didi` to your dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/antoniopantaleo/didi.git", from: "3.0.0")
]
```

Then depend on the products you need:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "Didi", package: "didi")
    ]
)
```

## Quick start

Here's a brief look on how `didi` API looks like:

### Registration

You can register a service to a type using the special `~>` syntax, listing all of your injections like this:

```swift
import Didi

let container: any Container = MyContainer()

container.register {
    Int.self ~> 2
    HTTPClient.self ~> URLSessionHTTPClient(session: .shared)
    String.self ~> {
        var result = "Hello"
        result += ", Didi"
        return result
    }
    // ...
}
```

> [!NOTE]
> You do not need to write commas within the registration closure

Registration offers compile-time safety thanks to Swift's powerful generics system. 
Wrong registration like the following will be clearly reported by the compiler:

```swift
  container.register {
    Int.self ~> "hello didi" // ⛔️ Binary operator '~>' cannot be applied to operands of type 'Int.Type' and 'String'
  }
```

### Resolution

Once registered, a service can be safely resolved using the `@Injected` property wrapper:

```swift
@Injected(in: container) var greeting: String? // Or simply '@Injected' if you provide a default container
print(greeting ?? "Missing")
```

## Backends

`didi` comes with a set of pre-implemented adapters (or backends) based on popular existing frameworks like:
- [Swinject](https://github.com/antoniopantaleo/didi-swinject.git)
- [Factory](https://github.com/antoniopantaleo/didi-factory.git)

## Contributing
Issues and pull requests are welcome. Feel free to contribute!
