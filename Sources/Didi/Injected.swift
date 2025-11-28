//
//  Injected.swift
//  Didi
//
//  Created by Antonio Pantaleo on 26/11/25.
//

/// A property wrapper that retrieves a registered dependency from a ``Container``
///
/// Use ``Injected`` when you want to easily access a registered service inside a ``Container`` instead of using ``Didi/Container/resolve(_:)``:
///
/// ```swift
/// @Injected(in: myContainer) var myService: MyService?
/// ```
///
/// The resulting type is an optional that is `nil` if the requested service isn't register in the ``Container``.
///
/// > Tip:
/// > You can provide a custom ``Didi/Injected/init(in:)`` method if you want a default container:
/// > ```swift
/// > extension Injected {
/// >   init() {
/// >       let mySharedContainer = MyContainer.shared
/// >       self.init(in: mySharedContainer)
/// >   }
/// > }
/// > ```
/// > You can then omit the argument when defining and ``Injected`` variable and use it like:
/// > ```swift
/// > @Injected var myService: Service?
/// > ```
///
@propertyWrapper
public struct Injected<P> {
    /// The resolved value, or `nil` if resolution failed.
    public let wrappedValue: P?
    
    /// Initializes the wrapper, attempting to resolve a value from the provided container.
    /// - Parameter container: The dependency container that supplies the requested type.
    public init(in container: any Container) {
        self.wrappedValue = try? container.resolve(P.self)
    }
}
