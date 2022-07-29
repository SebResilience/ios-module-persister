//
//  PreferenceOptionModelPersist.swift
//  
//
//  Created by Resilience on 06/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

class PreferenceOptionModelPersist: Object, PreferenceOptionModelProtocol {
    @Persisted (primaryKey: true) var choiceID: Int?
    @Persisted var name: String?
    @Persisted var order: Int?
}
