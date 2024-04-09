//
//  MainPresenter.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation
import UIKit

final class MainPresenter {
    weak var view: MainViewInput?

    private let router: MainRouterInput
    private let interactor: MainInteractorInput

    init(router: MainRouterInput, interactor: MainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainPresenter: MainViewOutput {
    func didLoadView() {
        print(#function)
    }
    
    func didPressFaqButton(){
        router.openFaq()
    }
}

private extension MainPresenter{
    
}

extension MainPresenter: MainInteractorOutput{
    
}
