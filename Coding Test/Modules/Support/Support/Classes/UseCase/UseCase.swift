//
//  UseCase.swift
//  Alamofire
//
//  Created by Savvycom on 5/10/22.
//

public protocol UseCase: AnyObject {
    associatedtype DM
    associatedtype EM
    
    func execute(param: DM) -> EM
}

public protocol UseCaseWithoutParam: AnyObject {
    associatedtype EM
    
    func execute() -> EM
}
