//
//  EventListCoordinator.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit

protocol EventListCoordinatorProtocol {

}

class EventListCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    weak var navigationController: UINavigationControllerProtocol?
    private let eventProvider: EventProviderProtocol

    init(navigationController: UINavigationControllerProtocol?,
         eventProvider: EventProviderProtocol) {
        self.eventProvider = eventProvider
        self.navigationController = navigationController
    }

    func start() {
        let eventListViewModel = EventListViewModel(provider: self.eventProvider)
        let eventListViewController = EventListViewController.instantiateFromStoryboard()
        eventListViewController.viewModel = eventListViewModel
        eventListViewController.coordinator = self

        self.navigationController?.pushViewController(eventListViewController, animated: true)
    }
}

extension EventListCoordinator: EventListCoordinatorProtocol {
    
}
