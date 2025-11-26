//
//  Container.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// TODO
public protocol Container {
    /// TODO
    /// - Parameter type: TODO
    /// - Returns: TODO
    func resolve<P>(_ type: P.Type) throws(ResolutionError) -> P
    
    /// TODO
    /// - Parameter component: TODO
    func register<P>(_ component: () -> Registration<P>)
}

public extension Container {
    /// TODO
    /// - Parameter component: TODO
    func register<P>(_ component: @autoclosure () -> Registration<P>) {
        register({ component() })
    }
    
    /// TODO
    /// - Parameter components: TODO
    func register<each P>(@RegistrationBuilder _ components: () -> (repeat Registration<each P>))  {
        for registration in repeat (each components()) {
            register(registration)
        }
    }
}
