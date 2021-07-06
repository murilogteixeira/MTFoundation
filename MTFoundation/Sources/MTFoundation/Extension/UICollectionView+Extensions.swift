//
//  UICollectionView+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.uniqueIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(
        with cellClass: T.Type,
        for indexPath: IndexPath
    ) -> UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: cellClass.uniqueIdentifier, for: indexPath)
    }
}

