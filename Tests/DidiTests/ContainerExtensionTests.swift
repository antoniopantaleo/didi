//
//  ContainerExtensionTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Testing
import Didi

@Suite
struct ContainerExtensionTests {
    @Test func registersUsingAutoclosureHelper() throws {
        let container = MockContainer()
        
        container.register(Int.self ~> 3)
        
        #expect(container.registeredTypes.count == 1)
        #expect(try container.resolve(Int.self) == 3)
    }
    
    @Test func registersMultipleComponentsWithBuilder() throws {
        let container = MockContainer()
        
        container.register {
            Int.self ~> 10
            String.self ~> "swift"
        }
        
        #expect(container.registeredTypes.count == 2)
        #expect(try container.resolve(Int.self) == 10)
        #expect(try container.resolve(String.self) == "swift")
    }
    
    @Test func resolveThrowsWhenServiceMissing() {
        let container = MockContainer()
        
        let error = #expect(throws: ResolutionError<Bool>.self) {
            _ = try container.resolve(Bool.self)
        }
        #expect(error?.localizedDescription == "No value of type Bool could be resolved.")
    }
}
