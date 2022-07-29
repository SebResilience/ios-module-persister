//
//  ContentPersistRepository.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import PersisterProtocol
import CoreModule
import RealmSwift

public class ContentPersistRepository: ContentPersistProtocol {

    //MARK: - private properties
    private let persistCLient = RealmPersister()

    public init() {}

    //MARK: - public methods
    public func saveArticles(_ articles: [ArticlesModelProtocol]) async -> Bool {
        return persistCLient.update(articles.compactMap({$0.convertToPersistModel}))
    }

    public func articles() async -> [ArticlesModelProtocol] {
        return (persistCLient.selectAll(ArticleModelPersist.self) as? [ArticlesModelProtocol]) ?? []
    }
}
