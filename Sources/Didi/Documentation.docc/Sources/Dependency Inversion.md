# Dependency Inversion

Keep your features depending on abstractions instead of a specific dependency injection engine

## Overview

The Dependency Inversion Principle keeps high-level code independent from low-level construction concerns. ``Container`` is the single protocol that represents this boundary in `didi`: your app just depends on it, while you are free to swap the underlying implementation without touching call sites.

Adapters such as [DidiSwinject](https://github.com/antoniopantaleo/didi-swinject) already ship conforming containers, but you can also provide your own as long as it can store ``Registration`` values and return services through ``Container/resolve(_:)``.


![diagram](didi-dependency-inversion-diagram-white)

Your app is free to change dependency injection framework with zero effort. You can use a lightweight ``Container`` in your tests to speed them up, or use different frameworks under different circumstances.
