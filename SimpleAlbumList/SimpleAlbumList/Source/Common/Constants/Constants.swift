//
//  Constants.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

typealias Closure<T> = (T) -> Void

struct Constants {
        
    enum Storyboards: String {
        case splash = "Splash"
        case albums = "Albums"
        case photos = "Photos"
        case photoDetail = "PhotoDetail"
    }
    
    struct APIs {
        static var host: String {
            return "https://jsonplaceholder.typicode.com/"
        }
    }
    
    struct Dimensions {
        static var albumCellSize: CGSize {
            let cellWidth = UIScreen.main.bounds.width
            let cellHeight = cellWidth / 3 // ratio
            return CGSize(width: cellWidth, height: cellHeight)
        }
        static var photoCellSize: CGSize {
            let cellWidth = UIScreen.main.bounds.width / 2
            let cellHeight = cellWidth * 1.45 // ratio
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
}
