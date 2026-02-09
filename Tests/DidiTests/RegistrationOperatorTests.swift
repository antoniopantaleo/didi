//
//  RegistrationOperatorTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Testing
import Didi

@Suite
struct RegistrationOperatorTests {
    
    @Test func usesFactoryClosure() {
        nonisolated(unsafe) var callCount = 0
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
        nonisolated(unsafe) var callCount = 0
        
        let registration = String.self ~> {
            callCount += 1
            return "value"
        }
        #expect(callCount == 0)
        
        #expect(registration.factory() == "value")
        #expect(callCount == 1)
    }
}
