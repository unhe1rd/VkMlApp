//
//  MainRouter.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation

final class MainRouter {
    weak var viewController: MainViewController?
}

extension MainRouter: MainRouterInput {
    func openViewController() {
        print(#function)
    }
}
