//
//  RegistrationBuilder.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// Result builder that aggregates multiple registrations into a tuple.
///
/// ResultBuilder's expressive syntax makes easy to create a registration DSL that can leverage the `~>` operator
///
/// > Example: Making registrations through ``RegistrationBuilder``
/// > ```swift
/// > container.register {
/// >   Int.self ~> 50
/// >   HTTPClient.self ~> URLSessionHTTPClient(session: .shared)
/// >   // ...
/// > }
///
///
@resultBuilder
public enum RegistrationBuilder {
    
    /// Combines individual registrations produced in the builder block.
    /// - Parameter components: A variadic list of registrations to bundle together.
    /// - Returns: A tuple containing every registration emitted by the builder.
    public static func buildBlock<each P>(_ components: repeat Registration<each P>) -> (repeat Registration<each P>) {
        (repeat (each components))
    }
}
