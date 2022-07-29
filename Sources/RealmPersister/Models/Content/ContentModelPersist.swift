//
//  ContentModelPersist.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import CoreModule
import RealmSwift
import PersisterProtocol

internal class ContentModelPersist: Object, ContentModelProtocol {
    @Persisted (primaryKey: true) var title: String?
    @Persisted var paragraph: String?
    @Persisted var listBulletPoints: List<String>
    
    var bulletPoints: [String]? {
        get {
            return listBulletPoints.toArray
        }
        set {
            let list = List<String>()
            newValue?.compactMap({$0}).forEach({ value in
                list.append(value)
            })
            listBulletPoints = list
        }
    }
}

extension ContentModelProtocol {
    var convertToPersistModel: ContentModelPersist {
        let model = ContentModelPersist()
        model.title = title
        model.paragraph = paragraph
        model.bulletPoints = bulletPoints
        return model
    }
}

extension Array where Element == ContentModelProtocol {
    var toPersistModel: [ContentModelPersist] {
        map({ $0.convertToPersistModel })
    }
}


