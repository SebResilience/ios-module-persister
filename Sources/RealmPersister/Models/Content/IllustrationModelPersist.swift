//
//  IllustrationModelPersist.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

class IllustrationModelPersist: Object, IllustrationModelProtocol {
    @Persisted (primaryKey: true) var id: Int
    @Persisted var height: Int?
    @Persisted var name: String?
    @Persisted var url: String?
    @Persisted var width: Int?
}

extension IllustrationModelProtocol {
    var convertToPersistModel: IllustrationModelPersist {
        let model = IllustrationModelPersist()
        model.id = id
        model.height = height
        model.name = name
        model.url = url
        model.width = width
        return model
    }
}
