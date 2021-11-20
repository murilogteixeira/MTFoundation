//
//  BaseCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 19/11/21.
//

import UIKit

class BaseCoordinator<RouteType: CoordinatorRoute>: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController, initialRoute route: RouteType) {
        self.childCoordinators = []
        self.navigationController = navigationController
        prepareTransition(for: route)
    }

    func trigger(_ route: RouteType) {
        DispatchQueue.main.async { [weak self] in
            self?.prepareTransition(for: route)
        }
    }

    func prepareTransition(for route: RouteType) { }

    func childDidFinish(_ child: Coordinator?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
}
