//
//  Container.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// A lightweight abstraction describing how registrations are stored and resolved.
public protocol Container {
    /// Resolves an instance of the requested type or throws when it is not registered.
    /// - Parameter type: The service type to resolve.
    /// - Returns: An instance of the requested type.
    /// - Throws: ResolutionError
    func resolve<P>(_ type: P.Type) throws(ResolutionError<P>) -> P
    
    /// Stores a registration, enabling later resolution.
    /// - Parameter component: A closure that returns a registration tuple for the service.
    func register<P>(_ component: () -> Registration<P>)
}

public extension Container {
    /// Convenience overload to register using an autoclosure to avoid manual wrapping.
    /// - Parameter component: An autoclosure producing the registration.
    func register<P>(_ component: @autoclosure () -> Registration<P>) {
        register({ component() })
    }
    
    /// Registers multiple components declared in a result builder block.
    /// - Parameter components: A builder returning one or more registrations.
    func register<each P>(@RegistrationBuilder _ components: () -> (repeat Registration<each P>))  {
        for registration in repeat (each components()) {
            register(registration)
        }
    }
}
