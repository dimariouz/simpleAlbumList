//
//  PhotosView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class PhotosView: RootViewController {
    
    @IBOutlet weak private var photosCollectionBgView: UIView!
    @IBOutlet weak private var emptyDataView: EmptyDataView!
    
    private let photosCollectionView = CollectionFactory.shared.create(type: .photos)
    
    let model = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhotosList()
    }
    
    private func setupUI() {
        title = model.title
        
        setupAlbumCollectionView()
        setupViewModel()
    }
    
    private func setupAlbumCollectionView() {
        photosCollectionBgView.add(subviews: photosCollectionView)
        photosCollectionView.fillSuperview()
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
    }
    
    private func setupEmptyDataView() {
        emptyDataView.isHidden = !model.photos.isEmpty
        emptyDataView.reloadButtonClosure = { [weak self] _ in
            self?.getPhotosList()
        }
    }
    
    private func getPhotosList() {
        animateIndicator(true)
        model.getPhotosList()
    }
    
    private func setupViewModel() {
        model.didReceiveResult = { [weak self] _ in
            self?.animateIndicator(false)
            self?.photosCollectionView.reloadData()
            self?.setupEmptyDataView()
        }
        model.didReceiveError = { [weak self] error in
            self?.animateIndicator(false)
            self?.handleError(with: error)
            self?.setupEmptyDataView()
        }
    }
    
    private func routeToPhotoDetailView(photoId: Int) {
        let view: PhotoDetailView = .instantiate(storyboard: .photoDetail)
        view.model.photoId = photoId
        push(to: view)
    }

}

extension PhotosView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = model.photos[indexPath.item]
        routeToPhotoDetailView(photoId: photo.id)
    }
}

extension PhotosView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: PhotoCell.self, forIndexPath: indexPath)
        let album = model.photos[indexPath.item]
        cell.configureCell(model: album)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeFadeAnimation(duration: cellAnimationDuration, delayFactor: cellAnimationDelay)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: collectionView)
    }
    
}

extension PhotosView: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.Dimensions.photoCellSize
    }
    
}
