//
//  MainInteractor.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation

final class MainInteractor {
    weak var output: MainInteractorOutput?
}

extension MainInteractor: MainInteractorInput {
    func loadData() {
        print(#function)
    }
}
