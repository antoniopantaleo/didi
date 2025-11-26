//
//  Injected.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// TODO
@propertyWrapper
public struct Injected<P> {
    /// TODO
    public let wrappedValue: P?
    
    /// TODO
    /// - Parameter container: TODO
    public init(in container: any Container) {
        self.wrappedValue = try? container.resolve(P.self)
    }
}
