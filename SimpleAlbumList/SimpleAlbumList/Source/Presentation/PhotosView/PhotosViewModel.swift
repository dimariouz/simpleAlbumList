//
//  PhotosViewModel.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import Foundation

final class PhotosViewModel {
    
    private let photosDataSource: PhotosDataSource
    
    init(dataSource: PhotosDataSource = PhotosNetworkService()) {
        self.photosDataSource = dataSource
    }
    
    var didReceiveError: Closure<Error>?
    var didReceiveResult: Closure<Void>?
    
    var photos: [Photo] = []
    var albumId: Int?
    
    var title: String {
        return "\("photos".localized): \("album".localized) \(albumId ?? 0)"
    }
    
    func getPhotosList() {
        photosDataSource.getPhotosList(by: albumId ?? 0) { result in
            switch result {
            case .success(let data):
                self.photos = data
                self.didReceiveResult?(())
            case .failure(let error):
                self.didReceiveError?(error)
            }
        }
    }
    
}
