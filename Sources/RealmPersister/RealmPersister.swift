//
//  File.swift
//  
//
//  Created by Resilience on 04/07/2022.
//
import Foundation
import RealmSwift
import PersisterProtocol


public class RealmPersister: PersisterProtocol {

    //MARK: - typeAlias
    public typealias Persistable = Object

    //MARK: - Life cycle
    public init() {}

    //MARK: - public methods
    public func create(_ objectType: Object) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objectType)
            }
            return true
        } catch {
            return false
        }
    }

    public func patch(_ objectType: Object) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objectType,update: .modified)
            }
            return true
        } catch {
            return false
        }
    }

    public func update(_ objectType: Object) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objectType, update: .all)
            }
            return true
        } catch {
            return false
        }
    }

    public func update(_ objectType: [Object]) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objectType, update: .all)
            }
            return true
        } catch let error{
            print(error)
            return false
        }
    }

    public func select(_ objectType: Object.Type) -> Object? {
        let realm = try? Realm()
        return realm?.objects(objectType).first
    }

    public func selectAll(_ objectType: Object.Type) -> [Object] {
        guard let realm = try? Realm() else { return []}
        return Array(realm.objects(objectType))
    }

    public func select(_ objectType: Object.Type, filter: NSPredicate) -> [Object] {
        guard let realm = try? Realm() else { return []}
        return Array(realm.objects(objectType).filter(filter))
    }

    public func delete(_ objectType: Object.Type, filter: NSPredicate) {
        guard let realm = try? Realm() else { return }
        realm.delete(realm.objects(objectType).filter(filter))
    }

    public func deleteAll(_ objectType: Object.Type) {
        guard let realm = try? Realm() else { return }
        realm.delete(realm.objects(objectType))
    }

    public func resetDB() {
        guard let realm = try? Realm() else { return }
        realm.deleteAll()
    }
}
