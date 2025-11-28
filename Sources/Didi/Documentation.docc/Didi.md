# ``Didi``

Dependency Inversion-first Dependency Injection framework

## Overview

`didi` is a lightweight dependency injection layer for Swift that puts the Dependency Inversion Principle first. Rather than being a full-blown service locator, it focuses on a small set of abstractions that you can back with your favorite DI engine or a home-grown container.

`didi` leans on expressive Swift features such as result builders, property wrappers, operators, and parameter packs to provide a type-safe API while keeping call sites small and readable.

## Getting Started

1. Choose or implement a concrete ``Container``. Adapters exist for popular engines like [Swinject](https://github.com/Swinject/Swinject), but any type that conforms to ``Container`` will work.
2. Register your services using the `~>` operator inside a ``RegistrationBuilder`` block:
    ```swift
    container.register {
        HTTPClient.self ~> URLSessionHTTPClient(session: .shared)
        String.self ~> "Hello, Didi"
    }
    ```
3. Resolve values where you need them, either directly or via the ``Injected`` property wrapper:
    ```swift
    // Direct resolution
    let client = try container.resolve(HTTPClient.self)
    // Resolution through '@Injected'
    @Injected(in: container) var greeting: String?
    ```

Registrations are checked at compile time, so mismatched types are caught early, and failures at runtime surface through ``ResolutionError``.

## Available Adapters

Currently `didi` natively support these adapters:

- [DidiSwinject](https://github.com/antoniopantaleo/didi-swinject), based on [Swinject](https://github.com/Swinject/Swinject)
- [DidiFactory](https://github.com/antoniopantaleo/didi-factory), based on [Factory](https://github.com/hmlongco/Factory)

## Topics

### Essentials

- <doc:Dependency-Inversion>
- ``Registration``
- ``Container``
- ``ResolutionError``

### A Nice API

- ``Injected``
- ``RegistrationBuilder``
