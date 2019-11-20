//
//  AppDelegate.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    private func createRootCoordinator() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let eventListRepository = EventListRepository(connector: AlamofireAdapter())
        self.rootCoordinator = RootCoordinator(navigationController: navigationController,
                                               eventProvider: EventProvider(repository: eventListRepository))
        self.window?.rootViewController = navigationController
        rootCoordinator?.start()
        
        self.window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        createRootCoordinator()
        return true
    }
}
