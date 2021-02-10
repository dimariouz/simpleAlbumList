//
//  UIViewController.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

extension UIViewController {
    
    class var name: String {
        return String(describing: self)
    }
    
    static func instantiate<T: UIViewController>(storyboard: Constants.Storyboards) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: T.name) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.name) ")
        }
        return view
    }
    
}
