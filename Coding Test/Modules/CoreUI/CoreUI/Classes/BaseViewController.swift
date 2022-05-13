//
//  BaseViewController.swift
//  CoreUI
//
//  Created by Minh Mon on 10/05/2022.
//

import Foundation
import Core

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func showLoading() { }
    
    open func hideLoading() { }
    
    open func showError(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
