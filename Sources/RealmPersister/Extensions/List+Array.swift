//
//  List+Array.swift
//  
//
//  Created by Resilience on 05/07/2022.
//

import Foundation
import RealmSwift

public extension List {
    var toArray: Array<Element> {
        return Array(self)
    }
}

public extension Sequence where Iterator.Element == Object {
    func toList<T>(_ type: T.Type) -> List<T> {
        let list = List<T>()
        return list
    }
}
