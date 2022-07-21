//
//  BasicServiceFactory.swift
//  
//
//  Created by Abhishek Kumar on 22/07/22.
//

import Foundation

struct BasicServiceFactory<ServiceType>: ServiceFactory {
    private let factory: (Resolver) -> ServiceType
    
    init(_ type: ServiceType.Type, factory: @escaping (Resolver) -> ServiceType) {
        self.factory = factory
    }
    
    func resolve(_ resolver: Resolver) -> ServiceType {
        return factory(resolver)
    }
}
