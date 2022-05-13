//
//  NewsRepository.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

import RxSwift

protocol NewsRepository: AnyObject {
    func getNews() -> Observable<Articles>
    func searchNews(query: String) -> Observable<Articles>
}
