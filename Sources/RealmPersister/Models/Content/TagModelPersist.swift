//
//  TagModelPersist.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

class TagModelPersist: Object, TagModelProtocol {
    @Persisted var listSymptomIDS: List<Int>
    @Persisted var gender: String?

    public var symptomIDS: [Int]? {
        get {
            return listSymptomIDS.toArray
        }
        set {
            let list = List<Int>()
            newValue?.compactMap({$0}).forEach({ value in
                list.append(value)
            })
            listSymptomIDS = list
        }
    }
}

extension TagModelProtocol {
    var convertToPersistModel: TagModelPersist {
        let model = TagModelPersist()
        model.gender = gender
        model.symptomIDS = symptomIDS
        return model
    }
}
