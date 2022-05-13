//
//  Coordinator.swift
//  Core
//
//  Created by Savvycom on 10/05/2022.
//

public protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childrenCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
