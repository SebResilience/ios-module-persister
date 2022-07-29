//
//  File.swift
//  
//
//  Created by Resilience on 28/07/2022.
//

import Foundation
import CoreModule
import RealmSwift
import PersisterProtocol

internal class ArticleModelPersist: Object, ArticlesModelProtocol {
    @Persisted (primaryKey: true) var id: Int
    @Persisted var listAuthorsId: List<Int>
    @Persisted var categoryID: Int?
    @Persisted var listContent: List<ContentModelPersist>
    @Persisted var coverModel: IllustrationModelPersist?
    @Persisted var editorialLine: Bool
    @Persisted var listLabels: List<String>
    @Persisted var name: String?
    @Persisted var order: Int?
    @Persisted var placeAtTop: Bool
    @Persisted var readingTime: Int?
    @Persisted var listSourceModel: List<SourceModelPersist>
    @Persisted var tagsModel: TagModelPersist?
    @Persisted var listTherapeuticAreaIDS: List<Int>
    @Persisted var updatedAt: String?


    public var authorIDS: [Int]? {
        get {
            return listAuthorsId.toArray
        }
        set {
            let list = List<Int>()
            newValue?.compactMap({$0}).forEach({ value in
                list.append(value)
            })
            listAuthorsId = list
        }
    }

    public var therapeuticAreaIDS: [Int]? {
        get {
            return listTherapeuticAreaIDS.toArray
        }
        set {
            let list = List<Int>()
            newValue?.compactMap({$0}).forEach({ value in
                list.append(value)
            })
            listTherapeuticAreaIDS = list
        }
    }

    public var labels: [String]? {
        get {
            return listLabels.toArray
        }
        set {
            let list = List<String>()
            newValue?.compactMap({$0}).forEach({ value in
                list.append(value)
            })
            listLabels = list
        }
    }

    var tags: TagModelProtocol? {
        get {
            return tagsModel
        }
        set {
            tagsModel = newValue?.convertToPersistModel
        }
    }

    var cover: IllustrationModelProtocol? {
        get {
            return coverModel
        }
        set {
            coverModel = newValue?.convertToPersistModel
        }
    }

    var content: [ContentModelProtocol]? {
        get {
            return listContent.toArray
        }
        set {
            listContent =  (newValue?.compactMap({$0.convertToPersistModel}).toList(ContentModelPersist.self)) ?? List()
        }
    }

    var sources: [SourceModelProtocol]? {
        get {
            return listSourceModel.toArray
        }
        set {
            listSourceModel =  (newValue?.compactMap({$0.convertToPersistModel}).toList(SourceModelPersist.self)) ?? List()
        }
    }
    

}

public extension ArticlesModelProtocol {
    internal var convertToPersistModel: ArticleModelPersist {
        let model = ArticleModelPersist()
        model.id = id
        model.editorialLine = editorialLine
        model.cover = cover
        model.authorIDS = authorIDS
        model.categoryID = categoryID
        model.content = content
        model.labels = labels
        model.therapeuticAreaIDS = therapeuticAreaIDS
        model.sources = sources
        model.tags = tags
        model.updatedAt = updatedAt
        model.name = name
        model.order = order
        model.placeAtTop = placeAtTop
        model.readingTime = readingTime
        model.sources = sources
        return model
    }
}
