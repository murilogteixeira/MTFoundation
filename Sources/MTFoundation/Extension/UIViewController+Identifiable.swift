//
//  UIViewController+Identifiable.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

#if os(iOS)
import UIKit

public extension UIViewController: Identifiable {}
public extension UICollectionViewCell: Identifiable {}
public extension UITableViewCell: Identifiable {}
#endif
