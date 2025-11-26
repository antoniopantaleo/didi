//
//  ResolutionError.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

import Foundation

/// An error thrown when a dependency cannot be resolved.
public struct ResolutionError: LocalizedError {
    public init() {}
    
    public var errorDescription: String? {
        "The requested dependency could not be resolved."
    }
}
