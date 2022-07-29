//
//  UserConsentModelPersist.swift
//  
//
//  Created by Resilience on 05/07/2022.
//

import Foundation
import RealmSwift
import CoreModule

public class UserConsentModelPersist: Object, UserConsentProtocol {
    public var statusType: TermsStatus?
    {
        get {
            return TermsStatus(rawValue: statusTypeValue ?? .empty)
        }
        set {
            statusTypeValue = newValue?.rawValue
        }
    }

    public var consentsType: ConsentsType? {
        get {
            return ConsentsType(rawValue: consentsTypeValue ?? .empty)
        }
        set {
            consentsTypeValue = newValue?.rawValue
        }
    }
    @Persisted var consentsTypeValue: String?
    @Persisted (primaryKey: true) public var version: String?
    @Persisted var statusTypeValue: String?

    convenience init(version: String?, consentsType: ConsentsType?, statusType: TermsStatus?) {
        self.init()
        self.version = version
        self.consentsType = consentsType
        self.statusType = statusType
    }
}
