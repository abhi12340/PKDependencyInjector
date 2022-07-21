//
//  Container.swift
//  
//
//  Created by Abhishek Kumar on 21/07/22.
//

import Foundation

// Custom Container handle registering and resolving of the dependencies.

public struct Container: Resolver {
    
    private let factories: [AnyServiceFactory]
    
    internal init() {
        self.factories = []
    }
    
    private init(factories: [AnyServiceFactory]) {
        self.factories = factories
    }
    
    // MARK: - Register
    
    @discardableResult
    public func register<T>(_ interface: T.Type, instance: T) -> Container {
        return register(interface) { _ in instance }
    }
    
    @discardableResult
    func register<ServiceType>(_ type: ServiceType.Type, _ factory: @escaping (Resolver) -> ServiceType) -> Container {
        assert(!factories.contains(where: { $0.supports(type) }))
        
        let newFactory = BasicServiceFactory<ServiceType>(type, factory: { resolver in
            factory(resolver)
        })
        return .init(factories: factories + [AnyServiceFactory(newFactory)])
    }
    
    // MARK: - Resolver
    public func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        return factory.resolve(self)
    }
    
    func factory<ServiceType>(for type: ServiceType.Type) -> () -> ServiceType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        
        return { factory.resolve(self) }
    }
}
