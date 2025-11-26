# Getting Started

Summary 

## Overview

Provide a concrete type that conforms to ``Container``. The `DIDI-Swinject` target already ships an adapter backed by [Swinject](https://github.com/Swinject/Swinject):

```swift
import DIDI
import DIDI_Swinject

let container = SwinjectContainer()
```

### Register services

Declare services using the ``~>(type:factory:)-5yccm`` operator. Registrations can be grouped with the ``RegistrationBuilder`` result builder:

```swift
container.register {
    Int.self ~> 42
    String.self ~> "Hello"
}
```

### Resolve services

Request a dependency through ``Container/resolve(_:)``. Resolution failures throw ``ResolutionError``:

```swift
let meaning = try container.resolve(Int.self)
```

For simpler property access, rely on ``Injected``:

```swift
@Injected(in: container) var greeting: String?
```

### Testing and mocking

Because the framework is protocol-driven, testing is straightforward. Provide a mock container that captures and returns values without touching the production registrations.
