//
//  AlbumCell.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class AlbumCell: UICollectionViewCell {

    @IBOutlet weak private var bgView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    private let bgCornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.roundCorners(radius: bgCornerRadius)
        bgView.addShadow()
    }
    
    func configureCell(model: Album) {
        titleLabel.text = "Album #\(model.id)\nTitle: \(model.title)"
    }

}
