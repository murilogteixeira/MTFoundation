//
//  AppCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 16/11/21.
//

import UIKit

public protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func childDidFinish(_ child: Coordinator?)
}

public protocol CoordinatorRoute { }
