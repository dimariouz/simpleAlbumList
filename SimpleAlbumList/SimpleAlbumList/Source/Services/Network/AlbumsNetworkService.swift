//
//  AlbumsNetworkService.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import Foundation
import Alamofire

private struct Paths {
    static let albums = "albums"
}

protocol AlbumsDataSource: class {
    func getAlbumsList(completion: @escaping (Result<[Album], Error>) -> Void)
}

final class AlbumsNetworkService: AlbumsDataSource {
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    
    func getAlbumsList(completion: @escaping (Result<[Album], Error>) -> Void) {
        networkService.get(path: Paths.albums, completion: completion)
    }
    
}
