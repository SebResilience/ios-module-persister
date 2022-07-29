//
//  PersisterProtocol.swift
//  
//
//  Created by Resilience on 04/07/2022.
//

import Foundation

public protocol PersisterProtocol {
    
    associatedtype Persistable
    func create(_ objectType: Persistable) -> Bool
    func patch(_ objectType: Persistable) -> Bool
    func update(_ object: Persistable) -> Bool
    func update(_ objectType: [Persistable]) -> Bool
    func select(_ objectType: Persistable.Type) -> Persistable?
    func selectAll(_ objectType: Persistable.Type) -> [Persistable]
    func select(_ objectType: Persistable.Type, filter: NSPredicate) -> [Persistable]
    func delete(_ objectType: Persistable.Type, filter: NSPredicate)
    func deleteAll(_ objectType: Persistable.Type)
    func resetDB()
}
