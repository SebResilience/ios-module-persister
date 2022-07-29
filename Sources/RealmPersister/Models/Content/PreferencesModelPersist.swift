//
//  PreferencesModelPersist.swift
//  
//
//  Created by Resilience on 06/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

public class PreferencesModelPersist: Object, PreferencesModelProtocol {
    @Persisted (primaryKey: true) public var preferenceID: Int?
    @Persisted public var name: String?
    @Persisted private var listChoices: List<PreferenceOptionModelPersist>
    public var choices: [PreferenceOptionModelProtocol]? {
        get {
            return listChoices.toArray
        }
        set {
            listChoices = (newValue?.compactMap({$0 as? Object}).toList(PreferenceOptionModelPersist.self)) ?? List()
        }
    }
}
