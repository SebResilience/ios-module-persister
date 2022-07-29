//
//  ContentPersistProtocol.swift
//  
//
//  Created by Resilience on 06/07/2022.
//

import Foundation
import CoreModule

public protocol ContentPersistProtocol {
    func saveArticles(_ articles: [ArticlesModelProtocol]) async -> Bool
    func articles() async -> [ArticlesModelProtocol] 
}
