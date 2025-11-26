//
//  Didi-SwinjectTests.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Foundation
import Testing
import Didi
import Didi_Swinject
import Swinject

@Suite
struct DidiSwinjectTests {
    @Test func resolvesRegisteredService() throws {
        let sut = SwinjectContainer()
        sut.register {
            Int.self ~> 2
        }
        
        let resolved = try sut.resolve(Int.self)
        #expect(resolved == 2)
    }
    
    @Test func writesIntoProvidedUnderlyingContainer() throws {
        let expected = UUID(uuidString: "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE")!
        let underlying = Swinject.Container()
        let sut = SwinjectContainer(container: underlying)
        
        sut.register { UUID.self ~> expected }
        
        let resolvedFromUnderlying = underlying.resolve(UUID.self)
        #expect(resolvedFromUnderlying == expected)
        #expect(try sut.resolve(UUID.self) == expected)
    }
    
    @Test func throwsResolutionErrorWhenServiceMissing() {
        let sut = SwinjectContainer()
        
        #expect(throws: Didi.ResolutionError.self) {
            _ = try sut.resolve(String.self)
        }
    }
    
    @Test func propertyWrapperResolvesThroughAdapter() {
        let sut = SwinjectContainer()
        sut.register { Double.self ~> 4.5 }
        
        @Injected(in: sut) var value: Double?
        #expect(value == 4.5)
    }
}
