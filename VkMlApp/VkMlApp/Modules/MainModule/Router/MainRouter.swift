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
    func openPickerController() {
        print(#function)
    }
    
    func openFaq() {
        print(#function)
        let faqViewController = UIHostingController(rootView: FaqView())
        viewController?.navigationController?.pushViewController(faqViewController, animated: true)
    }
}
