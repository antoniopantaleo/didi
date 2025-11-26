//
//  Registration.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// A tuple describing a registration entry in a container.
public typealias Registration<P> = (type: P.Type, factory: () -> P)

infix operator ~>

/// Creates a registration by pairing a type with a factory closure.
/// - Parameters:
///   - type: The service type to register.
///   - factory: A closure that produces new instances of the service.
/// - Returns: A registration that can be stored in a container.
public func ~> <P>(type: P.Type, factory: @escaping () -> P) -> Registration<P> {
    return (type, factory)
}

/// Convenience overload allowing autoclosure syntax for constant or simple factories.
/// - Parameters:
///   - type: The service type to register.
///   - factory: An autoclosure producing a service instance.
/// - Returns: A registration that can be stored in a container.
public func ~> <P>(type: P.Type, factory: @escaping @autoclosure () -> P) -> Registration<P> {
    return (type, factory)
}
