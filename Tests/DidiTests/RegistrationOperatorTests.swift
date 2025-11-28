//
//  RegistrationOperatorTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Testing
import Didi

@Suite
final class RegistrationOperatorTests {
    
    @Test func usesFactoryClosure() {
        var callCount = 0
        let registration = Int.self ~> {
            callCount += 1
            return 7
        }
        
        #expect(callCount == 0)
        #expect(registration.type == Int.self)
        #expect(registration.factory() == 7)
        #expect(callCount == 1)
    }
    
    @Test func capturesAutoclosureWithoutEagerEvaluation() {
        var callCount = 0
        func provide() -> String {
            callCount += 1
            return "value"
        }
        
        let registration = String.self ~> provide()
        #expect(callCount == 0)
        
        #expect(registration.factory() == "value")
        #expect(callCount == 1)
    }
}
