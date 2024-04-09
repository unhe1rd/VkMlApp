//
//  MainViewController.swift
//  VkMlApp
//
//  Created by Mike Ulanov on 08.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    //View Properties
    private let output: MainViewOutput
    
    private let mainHeaderLaber = UILabel()
    private let mainImageView = UIImageView()
    private let faqButton = UIButton()
    private let photosButton = UIButton()
    private let magicButton = UIButton()
    private let cameraButton = UIButton()
    
    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        output.didLoadView()
    }
}

private extension MainViewController {
    func setupUI(){
        view.backgroundColor = ColorsConstants.backgroundColor
        setupNavigationController()
        setupMainHeaderView()
        setupMainImageView()
        setupFaqButton()
        
        setupMagicButton()
        setupPhotosButton()
        setupCameraButton()
    }
    
    func setupNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = ColorsConstants.backButtonColor
        navigationItem.backBarButtonItem = backButton
    }
    
    func setupMainHeaderView(){
        view.addSubview(mainHeaderLaber)
        mainHeaderLaber.translatesAutoresizingMaskIntoConstraints = false
        mainHeaderLaber.textAlignment = .center
        mainHeaderLaber.font = UIFont(name: "AmericanTypewriter", size: 48)
        mainHeaderLaber.text = "Artify"
        
        NSLayoutConstraint.activate([
            mainHeaderLaber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            mainHeaderLaber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainHeaderLaber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainHeaderLaber.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func setupMainImageView(){
        view.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.layer.cornerRadius = 16
        mainImageView.tintColor = ColorsConstants.imageColor
        mainImageView.backgroundColor = ColorsConstants.viewColor
        mainImageView.alpha = 0.7
        
        let imageViewSize = view.frame.width - 32
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.topAnchor.constraint(equalTo: mainHeaderLaber.bottomAnchor, constant: 16),
            mainImageView.heightAnchor.constraint(equalToConstant: imageViewSize),
            mainImageView.widthAnchor.constraint(equalToConstant: imageViewSize)
        ])
    }
    
    // MARK: FaqButton
    func setupFaqButton(){
        view.addSubview(faqButton)
        faqButton.translatesAutoresizingMaskIntoConstraints = false
        faqButton.addTarget(self, action: #selector(didPressFaqButton), for: .touchUpInside)
        let imageName = ImageConstants.faqImageName
        let symbolPointSize: CGFloat = 32
        let buttonColor = ColorsConstants.faqButtonColor
        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            faqButton.setImage(symbolImage, for: .normal)
            faqButton.tintColor = buttonColor
        }
        
        let buttonSize:CGFloat = 64
        NSLayoutConstraint.activate([
            faqButton.topAnchor.constraint(equalTo: mainHeaderLaber.topAnchor),
            faqButton.trailingAnchor.constraint(equalTo: mainHeaderLaber.trailingAnchor),
            faqButton.heightAnchor.constraint(equalToConstant: buttonSize),
            faqButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    @objc func didPressFaqButton(){
        output.didPressFaqButton()
    }
    
    // MARK: MagicButton
    func setupMagicButton(){
        view.addSubview(magicButton)
        magicButton.translatesAutoresizingMaskIntoConstraints = false
        magicButton.addTarget(self, action: #selector(didPressMagicButton), for: .touchUpInside)
        let imageName = ImageConstants.magicImageName
        let buttonColor = ColorsConstants.magicButtonColor
        let symbolPointSize: CGFloat = 64
        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            magicButton.setImage(symbolImage, for: .normal)
            magicButton.tintColor = buttonColor
        }
        
        let buttonSize:CGFloat = view.frame.width / 4
        NSLayoutConstraint.activate([
            magicButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 128),
            magicButton.heightAnchor.constraint(equalToConstant: buttonSize),
            magicButton.widthAnchor.constraint(equalToConstant: buttonSize),
            magicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func didPressMagicButton(){
        print(#function)
    }
    
    // MARK: PhotosButton
    func setupPhotosButton(){
        view.addSubview(photosButton)
        photosButton.translatesAutoresizingMaskIntoConstraints = false
        photosButton.addTarget(self, action: #selector(didPressPhotosButton), for: .touchUpInside)
        let imageName = ImageConstants.photosImageName
        let buttonColor = ColorsConstants.photosButtonColor
        let symbolPointSize: CGFloat = 32
        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            photosButton.setImage(symbolImage, for: .normal)
            photosButton.tintColor = buttonColor
        }
        
        let buttonSize:CGFloat = view.frame.width / 8
        NSLayoutConstraint.activate([
            photosButton.centerYAnchor.constraint(equalTo: magicButton.centerYAnchor),
            photosButton.heightAnchor.constraint(equalToConstant: buttonSize),
            photosButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    @objc func didPressPhotosButton(){
        print(#function)
    }
    
    // MARK: CameraButton
    func setupCameraButton(){
        view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.addTarget(self, action: #selector(didPressCameraButton), for: .touchUpInside)
        let imageName = ImageConstants.cameraImageName
        let buttonColor = ColorsConstants.cameraButtonColor
        let symbolPointSize: CGFloat = 32
        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            cameraButton.setImage(symbolImage, for: .normal)
            cameraButton.tintColor = buttonColor
        }
        
        let buttonSize:CGFloat = view.frame.width / 8
        NSLayoutConstraint.activate([
            cameraButton.centerYAnchor.constraint(equalTo: magicButton.centerYAnchor),
            cameraButton.heightAnchor.constraint(equalToConstant: buttonSize),
            cameraButton.widthAnchor.constraint(equalToConstant: buttonSize),
        ])
    }
    
    @objc func didPressCameraButton(){
        print(#function)
    }
}

extension MainViewController: MainViewInput {
    func configure() {
        print(#function)
    }
}
