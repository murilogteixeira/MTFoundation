//
//  BaseCoordinator.swift
//  FinancialApp
//
//  Created by Murilo Teixeira on 19/11/21.
//

import UIKit

open class BaseCoordinator<RouteType: CoordinatorRoute>: Coordinator {
    public var children: [Coordinator] = []
    public var navigationController: UINavigationController
    public weak var parentCoordinator: Coordinator?

    public init(navigationController: UINavigationController, parentCoordinator: Coordinator?, initialRoute route: RouteType) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        prepareTransition(for: route)
    }

    public func trigger(_ route: RouteType) {
        DispatchQueue.main.async { [weak self] in
            self?.prepareTransition(for: route)
        }
    }

    open func prepareTransition(for route: RouteType) { }

    public func childDidFinish(_ child: Coordinator?) {
        if let index = children.firstIndex(where: { $0 === child }) {
            children.remove(at: index)
        }
    }
}
