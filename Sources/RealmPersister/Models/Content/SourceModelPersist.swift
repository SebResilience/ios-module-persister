//
//  SourceModelPersist.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

class SourceModelPersist: Object, SourceModelProtocol {
    @Persisted (primaryKey: true) var label: String?
    @Persisted var link: String?
}

extension SourceModelProtocol {
    var convertToPersistModel: SourceModelPersist {
        let model = SourceModelPersist()
        model.link = link
        model.label = label
        return model
    }
}
