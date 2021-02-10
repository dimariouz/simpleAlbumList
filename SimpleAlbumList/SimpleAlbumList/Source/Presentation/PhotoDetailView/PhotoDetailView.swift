//
//  PhotoDetailView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class PhotoDetailView: RootViewController {
    
    @IBOutlet weak private var photoImageView: UIImageView!
    @IBOutlet weak private var photoTitleLabel: UILabel!
    
    let model = PhotoDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhotoDetail()
    }
    
    private func setupUI() {
        title = model.title
        
        setupViewModel()
    }
    
    private func getPhotoDetail() {
        animateIndicator(true)
        model.getPhotoDetail()
    }
    
    private func setupViewModel() {
        model.didReceiveResult = { [weak self] _ in
            self?.animateIndicator(false)
            self?.setupPhotoDetail()
        }
        model.didReceiveError = { [weak self] error in
            self?.animateIndicator(false)
            self?.handleError(with: error)
        }
    }
    
    private func setupPhotoDetail() {
        photoImageView.downloaded(from: model.photoUrl)
        photoTitleLabel.text = model.photoTitle
    }

}
