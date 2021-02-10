//
//  Photo.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
