//
//  AppCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 16/11/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func childDidFinish(_ child: Coordinator?)
}

protocol CoordinatorRoute { }


