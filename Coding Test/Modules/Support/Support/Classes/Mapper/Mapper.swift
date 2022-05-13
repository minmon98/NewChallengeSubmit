//
//  Mapper.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

public protocol Mapper {
    associatedtype EM
    
    func map() -> EM
}
