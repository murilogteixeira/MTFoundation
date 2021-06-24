//
//  UITableView+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.uniqueIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: cellClass.uniqueIdentifier, for: indexPath)
    }
}
