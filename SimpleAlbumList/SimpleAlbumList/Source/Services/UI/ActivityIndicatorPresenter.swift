//
//  ActivityIndicatorPresenter.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

protocol ActivityIndicatorPresenter: class {
    var activityIndicator: UIActivityIndicatorView { get }
    func animateIndicator(_ animate: Bool)
}

extension ActivityIndicatorPresenter where Self: UIViewController {
    
    func animateIndicator(_ animate: Bool) {
        if animate {
            self.view.add(subviews: activityIndicator)
            activityIndicator.center = self.view.center
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
}
