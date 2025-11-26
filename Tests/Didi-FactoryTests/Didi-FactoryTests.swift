//
//  Didi-FactoryTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Testing
import Didi
import Didi_Factory
import Factory

@Suite
struct DidiFactoryTests {
    @Test func resolvesRegisteredService() throws {
        let sut = Didi_Factory.FactoryContainer()
        sut.register {
            Int.self ~> 21
            String.self ~> "hello"
        }
        
        #expect(try sut.resolve(Int.self) == 21)
        @Didi.Injected(in: sut) var stringValue: String?
        #expect(stringValue == "hello")
    }
    
//    @Test func sharesRegistrationsWithProvidedUnderlyingContainer() throws {
//        let base = Factory.Container()
//        let sut = FactoryContainer(container: base)
//        
//        sut.register { UUID.self ~> UUID(uuidString: "00000000-0000-0000-0000-000000000000")! }
//        
//        // Factory's Resolving API should also see the registration.
//        #expect(base.resolve(UUID.self) != nil)
//        #expect(try sut.resolve(UUID.self) == base.resolve(UUID.self))
//    }
//    
//    @Test func throwsResolutionErrorWhenServiceMissing() {
//        let sut = FactoryContainer()
//        
//        #expect(throws: ResolutionError.self) {
//            _ = try sut.resolve(String.self)
//        }
//    }
//    
//    @Test func propertyWrapperWorksThroughAdapter() {
//        let sut = FactoryContainer()
//        sut.register { Double.self ~> 9.5 }
//        
//        @Injected(in: sut) var value: Double?
//        #expect(value == 9.5)
//    }
}
