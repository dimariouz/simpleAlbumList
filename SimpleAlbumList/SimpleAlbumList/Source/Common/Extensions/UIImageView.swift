//
//  UIImageView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func cancelImageLoading() {
        self.sd_cancelCurrentImageLoad()
    }
    
    func downloaded(from url: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        if let image = SDImageCache.shared.imageFromDiskCache(forKey: url) {
            self.image = image
            return
        }
        guard let urlString = url,
              let url = URL(string: urlString) else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url) { (image, _, _, _) in
            self.image = image
        }
        self.contentMode = mode
    }
    
}
