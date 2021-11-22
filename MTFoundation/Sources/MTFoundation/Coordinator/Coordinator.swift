//
//  AppCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 16/11/21.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UINavigationController { get set }
    func childDidFinish(_ child: Coordinator?)
}

public protocol CoordinatorRoute { }


