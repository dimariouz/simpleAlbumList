//
//  RootViewController.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

class RootViewController: UIViewController, ActivityIndicatorPresenter, AlertPresenter {
   
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator =  UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.color = .darkGray
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    let cellAnimationDuration: TimeInterval= 0.5
    let cellAnimationDelay: TimeInterval = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundColor()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func push(to view: UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func setBackButtonHidden(_ isHidden: Bool) {
        self.navigationItem.setHidesBackButton(isHidden, animated: false)
    }
    
    func setLargeTitle(_ isLarge: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = isLarge
    }
    
    func handleError(with error: Error) {
        showAlert(message: error.localizedDescription)
    }

}
