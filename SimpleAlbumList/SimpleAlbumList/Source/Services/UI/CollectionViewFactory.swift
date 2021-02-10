//
//  CollectionViewFactory.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

enum CollectionType {
    case albums, photos
}

final class CollectionFactory {
    private init() {}
    
    static let shared = CollectionFactory()

    func create(type: CollectionType) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .zero
        
        switch type {
        case .albums:
            collectionView.register(nibs: [AlbumCell.self])
            layout.minimumLineSpacing = .zero
            layout.minimumInteritemSpacing = 10
            collectionView.contentInset = .zero
            collectionView.alwaysBounceVertical = true
        case .photos:
            collectionView.register(nibs: [PhotoCell.self])
//            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = .zero
            layout.minimumInteritemSpacing = .zero
            collectionView.contentInset = .zero
        }
        
        return collectionView
    }
    
}
