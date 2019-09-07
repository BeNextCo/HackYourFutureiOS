//
//  UINavigationProtocol.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit

/// sourcery: AutoMockable
protocol UINavigationControllerProtocol: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}

extension UINavigationController: UINavigationControllerProtocol {}
