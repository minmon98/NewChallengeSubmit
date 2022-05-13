//
//  SearchNewsUseCase.swift
//  News
//
//  Created by Savvycom on 11/05/2022.
//

import Support
import RxSwift

class SearchNewsUseCase: UseCase {
    typealias DM = String
    typealias EM = Observable<Articles>
    
    private let repository = NewsRepositoryImplement()
    
    func execute(param: String) -> Observable<Articles> {
        return repository.searchNews(query: param)
    }
}
