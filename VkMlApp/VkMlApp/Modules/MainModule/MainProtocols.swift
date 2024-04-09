//
//  MainProtocols.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func didLoadView()
    func didPressFaqButton()
}

protocol MainViewInput: AnyObject {
    func configure()
}

protocol MainRouterInput: AnyObject {
    func openPickerController()
    func openFaq()
}

protocol MainInteractorInput: AnyObject {
    func loadData()
}

protocol MainInteractorOutput: AnyObject {}
