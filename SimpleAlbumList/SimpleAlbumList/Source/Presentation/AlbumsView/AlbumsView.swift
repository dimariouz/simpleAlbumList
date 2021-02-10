//
//  AlbumsView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class AlbumsView: RootViewController {
    
    @IBOutlet weak private var albumsCollectionBgView: UIView!
    @IBOutlet weak private var emptyDataView: EmptyDataView!
    
    private let model = AlbumsViewModel()
    private let albumsCollectionView = CollectionFactory.shared.create(type: .albums)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAlbumsList()
    }
    
    private func setupUI() {
        title = "albums".localized
        
        setLargeTitle(true)
        setBackButtonHidden(true)
        setupAlbumCollectionView()
        setupViewModel()
    }
    
    private func setupAlbumCollectionView() {
        albumsCollectionBgView.add(subviews: albumsCollectionView)
        albumsCollectionView.fillSuperview()
        albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
    }
    
    private func setupEmptyDataView() {
        emptyDataView.isHidden = !model.albums.isEmpty
        emptyDataView.reloadButtonClosure = { [weak self] _ in
            self?.getAlbumsList()
        }
    }
    
    private func getAlbumsList() {
        animateIndicator(true)
        model.getAlbumsList()
    }
    
    private func setupViewModel() {
        model.didReceiveResult = { [weak self] _ in
            self?.animateIndicator(false)
            self?.albumsCollectionView.reloadData()
            self?.setupEmptyDataView()
        }
        model.didReceiveError = { [weak self] error in
            self?.animateIndicator(false)
            self?.handleError(with: error)
            self?.setupEmptyDataView()
        }
    }
    
    private func routeToPhotosView(albumId: Int) {
        let view: PhotosView = .instantiate(storyboard: .photos)
        view.model.albumId = albumId
        push(to: view)
    }
    
}

extension AlbumsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = model.albums[indexPath.item]
        routeToPhotosView(albumId: album.id)
    }
}

extension AlbumsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: AlbumCell.self, forIndexPath: indexPath)
        let album = model.albums[indexPath.item]
        cell.configureCell(model: album)
        return cell
    }
    
}

extension AlbumsView: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.Dimensions.albumCellSize
    }
    
}
