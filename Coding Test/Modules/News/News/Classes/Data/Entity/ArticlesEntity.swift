//
//  ArticlesEntity.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

import Support

public class ArticlesEntity: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [ArticleEntity]?
}

extension ArticlesEntity: Mapper {
    public typealias EM = Articles
    
    public func map() -> Articles {
        let articles = Articles()
        articles.status = status
        articles.totalResults = totalResults
        articles.articles = self.articles?.map { $0.map() }
        return articles
    }
}
