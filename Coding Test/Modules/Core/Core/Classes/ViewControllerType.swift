//
//  ViewControllerType.swift
//  Core
//
//  Created by Minh Mon on 10/05/2022.
//

import Foundation

public protocol ViewControllerType: AnyObject {
    associatedtype ViewModelType
    
    func configViewModel(viewModel: ViewModelType)
    func setupViews()
    func bindViewModel()
}
