//
//  SplashView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class SplashView: RootViewController {

    @IBOutlet weak private var titleLabel: UILabel!
    private let routeDelay: TimeInterval = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        routeToAlbumsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true)
    }
    
    private func setupUI() {
        titleLabel.text = "app_title".localized
    }
    
    private func routeToAlbumsView() {
        let view: AlbumsView = .instantiate(storyboard: .albums)
        DispatchQueue.main.asyncAfter(deadline: .now() + routeDelay) {
            self.push(to: view)
        }
        
    }

}
