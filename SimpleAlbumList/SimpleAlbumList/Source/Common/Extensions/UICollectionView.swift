//
//  UICollectionView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

extension UICollectionView {
    
    func register(nibs: [UICollectionViewCell.Type]) {
        for cell in nibs {
            let nib = UINib(nibName: cell.reuseIdentifier, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: cell.reuseIdentifier)
        }
    }
    
    func register(headers: [UICollectionReusableView.Type]) {
        for header in headers {
            let nib = UINib(nibName: header.reuseIdentifier, bundle: nil)
            self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.reuseIdentifier)
        }
    }
    
    func register(cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            self.register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
        }
    }
    
    func dequeue<T: UICollectionViewCell>(cellClass: T.Type,
                                          forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func dequeue<T: UICollectionReusableView>(headerClass: T.Type, kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(headerClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return header
    }
    
}
