//
//  RegistrationBuilder.swift
//  DIDI
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// Result builder that aggregates multiple registrations into a tuple.
@resultBuilder
public enum RegistrationBuilder {
    
    /// Combines individual registrations produced in the builder block.
    /// - Parameter components: A variadic list of registrations to bundle together.
    /// - Returns: A tuple containing every registration emitted by the builder.
    public static func buildBlock<each P>(_ components: repeat Registration<each P>) -> (repeat Registration<each P>) {
        (repeat (each components))
    }
}
