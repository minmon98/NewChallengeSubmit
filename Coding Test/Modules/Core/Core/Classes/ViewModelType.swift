//
//  ViewModelType.swift
//  Core
//
//  Created by Savvycom on 10/05/2022.
//

import Foundation

public protocol ViewModelType: AnyObject {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get set }
    var output: Output { get set }
}
