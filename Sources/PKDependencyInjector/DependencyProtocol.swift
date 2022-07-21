//
//  Resolver.swift
//  Created by Abhishek Kumar on 21/07/22.
//

import Foundation

protocol Resolver {
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType
}

extension Resolver {
    func factory<ServiceType>(for type: ServiceType.Type) -> () -> ServiceType {
        return { self.resolve(type) }
    }
}

protocol ServiceFactory {
    associatedtype ServiceType
    
    func resolve(_ resolver: Resolver) -> ServiceType
}

extension ServiceFactory {
    func supports<T>(_ type: T.Type) -> Bool {
        return type == ServiceType.self
    }
}
