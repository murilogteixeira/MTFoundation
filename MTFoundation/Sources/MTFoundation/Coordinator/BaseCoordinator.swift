//
//  BaseCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 19/11/21.
//

import UIKit

open class BaseCoordinator<RouteType: CoordinatorRoute>: Coordinator {
    public var childCoordinators: [Coordinator]
    public var navigationController: UINavigationController
    public weak var parentCoordinator: Coordinator?

    public init(navigationController: UINavigationController, initialRoute route: RouteType) {
        self.childCoordinators = []
        self.navigationController = navigationController
        prepareTransition(for: route)
    }

    public func trigger(_ route: RouteType) {
        DispatchQueue.main.async { [weak self] in
            self?.prepareTransition(for: route)
        }
    }

    func prepareTransition(for route: RouteType) { }

    public func childDidFinish(_ child: Coordinator?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
}
