//
//  PhotoDetailViewModel.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import Foundation

final class PhotoDetailViewModel {
    
    private let photosDataSource: PhotosDataSource
    
    init(dataSource: PhotosDataSource = PhotosNetworkService()) {
        self.photosDataSource = dataSource
    }
    
    var didReceiveError: Closure<Error>?
    var didReceiveResult: Closure<Void>?
    
    var photoDetail: Photo?
    var photoId: Int?
    
    var title: String {
        return "\("photo".localized) #\(photoId ?? 0) \("detail".localized)"
    }
    
    var photoUrl: String? {
        return photoDetail?.url
    }
    
    var photoTitle: String? {
        return photoDetail?.title
    }
    
    func getPhotoDetail() {
        photosDataSource.getPhotoDetail(by: photoId ?? 0) { result in
            switch result {
            case .success(let data):
                self.photoDetail = data
                self.didReceiveResult?(())
            case .failure(let error):
                self.didReceiveError?(error)
            }
        }
    }
    
}
