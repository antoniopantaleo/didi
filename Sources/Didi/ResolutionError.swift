//
//  ResolutionError.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Foundation

/// An error thrown when a dependency cannot be resolved.
public struct ResolutionError<P>: LocalizedError {
    
    private let type: P.Type
    
    public init(type: P.Type) {
        self.type = type
    }
    
    public var errorDescription: String? {
        "No value of type \(type) could be resolved."
    }
}
