//
//  ProfileModelPersist.swift
//  
//
//  Created by Resilience on 05/07/2022.
//

import Foundation
import CoreModule
import RealmSwift

public class ProfileModelPersist: Object, ProfileModelProtocol {
    public var gender: Gender? {
        get {
            return Gender(rawValue: genderValue ?? .empty)
        }
        set {
            genderValue = newValue?.rawValue
        }
    }
    public var consents: [UserConsentProtocol]? {
        get {
            return consentsList.toArray
        }
        set {
            consentsList = (newValue?.compactMap({$0 as? Object}).toList(UserConsentModelPersist.self)) ?? List()
        }
    }
    @Persisted (primaryKey: true) public var email: String?
    @Persisted public var birthDate: String?
    @Persisted public var firstName: String?
    @Persisted public var lastName: String?
    @Persisted public var mixpanelID: String?
    @Persisted public var phoneNumber: String?
    @Persisted public var rpmEnabled: Bool?
    @Persisted private var consentsList: List<UserConsentModelPersist>
    @Persisted private var genderValue: String?
}


extension ProfileModelProtocol {
    var convert: ProfileModelPersist {
        let model = ProfileModelPersist()
        model.gender = self.gender
        model.consents = self.consents
        model.birthDate = self.birthDate
        model.firstName = self.firstName
        model.lastName = self.lastName
        model.mixpanelID = self.mixpanelID
        model.phoneNumber = self.phoneNumber
        model.rpmEnabled = self.rpmEnabled
        return model
    }
}
