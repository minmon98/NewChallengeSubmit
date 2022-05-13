//
//  GetNewsUseCase.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

import Support
import RxSwift

class GetNewsUseCase: UseCaseWithoutParam {
    typealias EM = Observable<Articles>
    
    private let repository = NewsRepositoryImplement()
    
    func execute() -> Observable<Articles> {
        return repository.getNews()
    }
}
