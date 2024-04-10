//
//  MainProtocols.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation
import UIKit

protocol MainViewOutput: AnyObject {
    func didLoadView()
    func didPressFaqButton()
    func didPressPhotosButton()
    func didPressCameraButton()
    func didPressMagicButton(image: UIImage)
    func didPressShareButton(image: UIImage)
}

protocol MainViewInput: AnyObject {
    func configure(with image: UIImage)
    func showMagicButton()
}

protocol MainRouterInput: AnyObject {
    func openPickerControllerFromPhotoesButton()
    func openPickerControllerFromCameraButton()
    func openFaq()
    func openAlertFromMagicButton()
    func openActivityViewController(with image: UIImage)
}

protocol MainInteractorInput: AnyObject {
    func loadData()
}

protocol MainInteractorOutput: AnyObject {}
