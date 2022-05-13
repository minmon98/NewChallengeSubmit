//
//  NewsRepositoryImplement.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

import RxSwift
import Support

class NewsRepositoryImplement: NewsRepository {
    func getNews() -> Observable<Articles> {
        return GetNewsEndpoint()
            .request()
            .map({ $0.map() })
    }
    
    func searchNews(query: String) -> Observable<Articles> {
        return SearchNewsEndpoint(query: query)
            .request()
            .map({ $0.map() })
    }
}
