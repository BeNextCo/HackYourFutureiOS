//
//  RootCoordinator.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit

class RootCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    weak var navigationController: UINavigationControllerProtocol?
    private let eventProvider: EventProviderProtocol

    init(navigationController: UINavigationControllerProtocol?,
         eventProvider: EventProviderProtocol) {
        self.navigationController = navigationController
        self.eventProvider = eventProvider
    }

    func start() {
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController,
                                                        eventProvider: eventProvider)
        eventListCoordinator.start()
        childCoordinators.append(eventListCoordinator)
    }
}
