//
//  MainRouter.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation
import UIKit
import SwiftUI

final class MainRouter {
    weak var viewController: MainViewController?
}

extension MainRouter: MainRouterInput {
    func openPickerControllerFromPhotoesButton() {
        print(#function)
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .photoLibrary
        pickerViewController.delegate = viewController
        pickerViewController.allowsEditing = true
        viewController?.present(pickerViewController, animated: true)
    }
    
    func openFaq() {
        print(#function)
        let faqViewController = UIHostingController(rootView: FaqView())
        viewController?.navigationController?.pushViewController(faqViewController, animated: true)
    }
    
    func openPickerControllerFromCameraButton() {
        print(#function)
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .camera
        pickerViewController.delegate = viewController
        pickerViewController.allowsEditing = true
        viewController?.present(pickerViewController, animated: true)
    }
    
    func openAlertFromMagicButton(){
        let alert = UIAlertController(title: nil, message: "Вы не можете улучшать стандартную картинку, она и так идеальна", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func openActivityViewController(with image: UIImage){
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}
