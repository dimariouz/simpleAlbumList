//
//  PhotosNetworkService.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import Foundation

private struct Paths {
    static func photos(_ albumId: Int) -> String {
        return "photos?albumId=\(albumId)"
    }
    static func photoDetail(_ photoId: Int) -> String {
        return "photos/\(photoId)"
    }
}

protocol PhotosDataSource: class {
    func getPhotosList(by albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void)
    func getPhotoDetail(by photoId: Int, completion: @escaping (Result<Photo, Error>) -> Void)
}

final class PhotosNetworkService: PhotosDataSource {
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    
    func getPhotosList(by albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        networkService.get(path: Paths.photos(albumId), completion: completion)
    }
    
    func getPhotoDetail(by photoId: Int, completion: @escaping (Result<Photo, Error>) -> Void) {
        networkService.get(path: Paths.photoDetail(photoId), completion: completion)
    }
    
}
