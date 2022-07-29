//
//  PatientPersistProtocol.swift
//  
//
//  Created by Resilience on 05/07/2022.
//

import Foundation
import CoreModule

public protocol PatientPersistProtocol {
    var profile: ProfileModelProtocol? { get }
    func createProfile(profile: ProfileModelProtocol) -> Bool
    func replaceProfile(profile: ProfileModelProtocol) -> Bool
    func updateProfile(profile: ProfileModelProtocol) -> Bool
}
