//
//  Injected.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// Property wrapper that retrieves a dependency from a `Container`.
@propertyWrapper
public struct Injected<P> {
    /// The resolved value, or `nil` if resolution failed.
    public let wrappedValue: P?
    
    /// Initializes the wrapper, attempting to resolve a value from the provided container.
    /// - Parameter container: The dependency container that supplies the requested type.
    public init(in container: any Container) {
        self.wrappedValue = try? container.resolve(P.self)
    }
}
