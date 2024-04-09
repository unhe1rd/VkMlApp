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
    func didPressPhotosButton() {
        router.openPickerControllerFromPhotoesButton()
    }
    
    func didLoadView() {
        print(#function)
    }
    
    func didPressFaqButton(){
        router.openFaq()
    }
    
    func didPressCameraButton() {
        router.openPickerControllerFromCameraButton()
    }
    
    func didPressMagicButton(image: UIImage) {
        if image == UIImage(named: "defaultImage") {
            router.openAlertFromMagicButton()
        }
        else {
            
        }
    }
}

private extension MainPresenter {
    func mlHandler(){
        
    }
}

extension MainPresenter: MainInteractorOutput{
    
}
