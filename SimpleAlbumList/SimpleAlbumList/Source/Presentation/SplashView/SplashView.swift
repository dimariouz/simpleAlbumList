//
//  SplashView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class SplashView: UIViewController {

    @IBOutlet weak private var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = "app_title".localized
    }

}
