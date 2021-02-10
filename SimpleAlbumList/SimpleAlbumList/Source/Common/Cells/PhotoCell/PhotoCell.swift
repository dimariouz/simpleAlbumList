//
//  PhotoCell.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class PhotoCell: UICollectionViewCell {

    @IBOutlet weak private var bgView: UIView!
    @IBOutlet weak private var photoImageView: UIImageView!
    @IBOutlet weak private var photoTitle: UILabel!
    
    private let bgCornerRadius: CGFloat = 10
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.cancelImageLoading()
        photoTitle.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.roundCorners(radius: bgCornerRadius)
        bgView.addShadow()
    }
    
    func configureCell(model: Photo) {
        photoImageView.downloaded(from: model.url)
        photoTitle.text = "Title: \(model.title)"
    }

}
