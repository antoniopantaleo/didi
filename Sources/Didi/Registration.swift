//
//  Registration.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// A type that describes a registration entry in a ``Container``
public typealias Registration<P> = (type: P.Type, factory: () -> P)

infix operator ~>

/// Creates a ``Registration`` by pairing a type with a factory closure.
/// - Parameters:
///   - type: The service type to register.
///   - factory: A closure that produces new instances of the service.
/// - Returns: A ``Registration`` that can be stored in a ``Container``.
public func ~> <P>(type: P.Type, factory: @escaping () -> P) -> Registration<P> {
    return (type, factory)
}

/// Convenience overload allowing autoclosure syntax for constant or simple factories.
/// - Parameters:
///   - type: The service type to register.
///   - factory: An autoclosure producing a service instance.
/// - Returns: A ``Registration`` that can be stored in a ``Container``.
public func ~> <P>(type: P.Type, factory: @escaping @autoclosure () -> P) -> Registration<P> {
    return (type, factory)
}
