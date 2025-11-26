# ``Didi``

Dependency Inversion first Dependency Injection framework.

## Overview

`Didi` is a lightweight dependency injection framework for Swift that follows the Dependency Inversion Principle. It focuses on an approachable API that is easy to integrate into existing projects and to adapt to different storage backends.

Use the ``Container`` protocol to describe how dependencies are registered and resolved. The ``Registration`` type alias and ``~>`` operator help declare registrations concisely, while the ``Injected`` property wrapper provides a lightweight way to pull dependencies into properties.


## Topics

### Essentials

- <doc:Getting-Started>
- ``Registration``
- ``Container``
- ``ResolutionError``
- ``Injected``
- ``RegistrationBuilder``

### Operators

- ``~>(type:factory:)-5yccm``
- ``~>(type:factory:)-6npyy``

### Adapters

- ``SwinjectContainer``
- ``FactoryContainer``
