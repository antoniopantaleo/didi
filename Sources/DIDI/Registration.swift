//
//  Registration.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// TODO
public typealias Registration<P> = (type: P.Type, factory: () -> P)

infix operator ~>

/// TODO
/// - Parameters:
///   - type: TODO
///   - factory: TODO
/// - Returns: TODO
public func ~> <P>(type: P.Type, factory: @escaping () -> P) -> Registration<P> {
    return (type, factory)
}

/// TODO
/// - Parameters:
///   - type: TODO
///   - factory: TODO
/// - Returns: TODO
public func ~> <P>(type: P.Type, factory: @escaping @autoclosure () -> P) -> Registration<P> {
    return (type, factory)
}
