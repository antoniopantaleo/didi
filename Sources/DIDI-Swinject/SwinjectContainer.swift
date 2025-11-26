//
//  SwinjectContainer.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import DIDI
import Swinject

/// TODO
public final class SwinjectContainer: DIDI.Container {
    
    private let container: Swinject.Container
    
    /// TODO
    public init(container: Swinject.Container = Swinject.Container()) {
        self.container = container
    }
    
    /// TODO
    /// - Parameter component: TODO
    public func register<P>(_ component: () -> Registration<P>) {
        let (service, factory) = component()
        container.register(service, factory: { _ in factory() })
    }
    
    /// TODO
    /// - Parameter type: TODO
    /// - Returns: TODO
    public func resolve<P>(_ type: P.Type) throws(DIDI.ResolutionError) -> P {
        guard let resolved = container.resolve(type) else {
            throw DIDI.ResolutionError()
        }
        return resolved
    }
}
