//
//  MainPresenter.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import Foundation
import UIKit
import Vision
import CoreML
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
    func didPressMagicButton(image: UIImage) {
        if image == UIImage(named: "defaultImage") {
            router.openAlertFromMagicButton()
            view?.showMagicButton()
        }
        else {
            DispatchQueue.global().async {
                self.mlHandle(imageData: image){
                    DispatchQueue.main.async {
                        print("[DEBUG] Show magic button \(self.currentTimeInMilliSeconds)")
                        self.view?.showMagicButton()
                    }
                }
            }
        }
    }
    
    func didPressPhotosButton() {
        router.openPickerControllerFromPhotoesButton()
    }
    
    func didPressFaqButton(){
        router.openFaq()
    }
    
    func didPressCameraButton() {
        router.openPickerControllerFromCameraButton()
    }
    
    func didPressShareButton(image: UIImage) {
        router.openActivityViewController(with: image)
    }
    
    func didLoadView() {
        print(#function)
    }
}

private extension MainPresenter {
    var currentTimeInMilliSeconds: Int {
        let currentDate = Date()
        let since1970 = currentDate.timeIntervalSince1970
        return Int(since1970 * 1000)
    }
    
    func mlHandle(imageData: UIImage? , completion: @escaping () -> Void){
        print(#function)
        let currentTime = currentTimeInMilliSeconds
        print("[DEBUG] \(#line) \(currentTimeInMilliSeconds - currentTime)")
        guard
            let image = imageData,
            let model = try? AnimeGANv2_512(configuration: .init()),
            let ciImage = CIImage(image: image),
            let visionModel = try? VNCoreMLModel(for: model.model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: visionModel) { request, error in
            guard
                let results = request.results as? [VNPixelBufferObservation],
                let pixelBuffer = results.first?.pixelBuffer
            else {
                return
            }
            let mlImage = UIImage(pixelBuffer: pixelBuffer)
            guard let resultImage = mlImage else { return }
            DispatchQueue.main.async{
                self.view?.configure(with: resultImage)
                print("[DEBUG] configure resultImage \(self.currentTimeInMilliSeconds)")
                completion()
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global().async {
            do {
                try handler.perform([request])
            } catch {
                print("[DEBUG] Error proccessing CoreML image \(error)")
            }
        }
    }
}

extension MainPresenter: MainInteractorOutput{
    
}

extension UIImage {
    convenience init?(pixelBuffer: CVPixelBuffer) {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
