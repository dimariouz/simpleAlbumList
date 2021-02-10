//
//  AlertPresenter.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

protocol AlertPresenter: class {
    func showAlert(title: String, message: String, actions: [UIAlertAction])
}

extension AlertPresenter where Self: UIViewController {
    
    func showAlert(title: String = "error".localized,
                   message: String,
                   actions: [UIAlertAction] = []) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if actions.isEmpty {
            alert.addAction(UIAlertAction(title: "close".localized, style: .default, handler: { _ in
            }))
        } else {
            actions.forEach { action in
                alert.addAction(action)
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}
