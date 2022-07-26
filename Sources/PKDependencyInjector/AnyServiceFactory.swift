//
//  AnyServiceFactory.swift
//  
//
//  Created by Abhishek Kumar on 22/07/22.
//

import Foundation

final class AnyServiceFactory {
    private let _resolve: (Resolver) -> Any
    private let _supports: (Any.Type) -> Bool
    
    init<T: ServiceFactory>(_ serviceFactory: T) {
        self._resolve = { resolver -> Any in
            serviceFactory.resolve(resolver)
        }
        self._supports = { $0 == T.ServiceType.self }
    }
    
    func resolve<ServiceType>(_ resolver: Resolver) -> ServiceType {
        let resolver = _resolve(resolver) as? ServiceType
        return resolver!
    }
    
    func supports<ServiceType>(_ type: ServiceType.Type) -> Bool {
        return _supports(type)
    }
}
