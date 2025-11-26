//
//  MockContainer.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Foundation
import DIDI

final class MockContainer: Container {
    private var factories: [ObjectIdentifier: () -> Any] = [:]
    var registeredTypes: [ObjectIdentifier] = []
    
    func resolve<P>(_ type: P.Type) throws(ResolutionError) -> P {
        guard let factory = factories[ObjectIdentifier(type)], let value = factory() as? P else {
            throw ResolutionError()
        }
        return value
    }
    
    func register<P>(_ component: () -> Registration<P>) {
        let registration = component()
        registeredTypes.append(ObjectIdentifier(registration.type))
        factories[ObjectIdentifier(registration.type)] = registration.factory
    }
}
