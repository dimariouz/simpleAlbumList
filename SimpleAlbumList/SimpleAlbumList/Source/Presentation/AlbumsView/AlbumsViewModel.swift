//
//  AlbumsViewModel.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class AlbumsViewModel {
    
    private let albumsDataSource: AlbumsDataSource
    
    init(dataSource: AlbumsDataSource = AlbumsNetworkService()) {
        self.albumsDataSource = dataSource
    }
    
    var didReceiveError: Closure<Error>?
    var didReceiveResult: Closure<Void>?
    
    var albums: [Album] = []
    
    func getAlbumsList() {
        albumsDataSource.getAlbumsList { result in
            switch result {
            case .success(let data):
                self.albums = data
                self.didReceiveResult?(())
            case .failure(let error):
                self.didReceiveError?(error)
            }
        }
    }
    
}
