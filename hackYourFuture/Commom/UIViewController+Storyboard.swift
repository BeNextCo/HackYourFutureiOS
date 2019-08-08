//
//  UIViewController+Storyboard.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }

    private static func instantiateFromStoryboardHelper<T>() -> T {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: name) as? T else {
            preconditionFailure("'\(name)': instantiateInitialViewController failed.")
        }

        return controller
    }
}
