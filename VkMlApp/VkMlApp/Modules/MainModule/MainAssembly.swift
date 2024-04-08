//
//  MaunContainer.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import UIKit

final class MainAssembly {
    static func assembly() -> UIViewController {
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter(router: router, interactor: interactor)
        let viewController = MainViewController(output: presenter)
        
        presenter.view = viewController
        router.viewController = viewController
        interactor.output = presenter

        return viewController
    }
}
