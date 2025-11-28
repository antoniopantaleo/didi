//
//  InjectedPropertyWrapperTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Testing
import Didi

@Suite
struct InjectedPropertyWrapperTests {
    @Test func injectsResolvedValue() {
        let container = MockContainer()
        container.register { Double.self ~> 1.5 }
        
        @Injected(in: container) var value: Double?
        #expect(value == 1.5)
    }
    
    @Test func returnsNilOnFailedResolution() {
        let container = MockContainer()
        
        @Injected(in: container) var value: Int?
        #expect(value == nil)
    }
}
