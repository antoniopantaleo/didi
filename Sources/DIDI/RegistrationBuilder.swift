//
//  RegistrationBuilder.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// TODO
@resultBuilder
public enum RegistrationBuilder {
    
    /// TODO
    /// - Parameter components: TODO
    /// - Returns: TODO
    public static func buildBlock<each P>(_ components: repeat Registration<each P>) -> (repeat Registration<each P>) {
        (repeat (each components))
    }
}
