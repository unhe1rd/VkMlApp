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
    private let shareButton = UIButton()
    private let faqButton = UIButton()
    private let photosButton = UIButton()
    private let magicButton = UIButton()
    private let cameraButton = UIButton()
    
    private var photosButtonSpringConstraint = NSLayoutConstraint()
    private var magicButtonSpringConstraint = NSLayoutConstraint()
    private var cameraButtonSpringConstraint = NSLayoutConstraint()
    
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
        updateButtonConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAppearButtonsAnimate()
    }
}

private extension MainViewController {
    func setupUI(){
        view.backgroundColor = ColorsConstants.backgroundColor
        setupNavigationController()
        setupMainHeaderView()
        setupMainImageView()
        setupFaqButton()
        setupShareButton()
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
        mainImageView.layer.masksToBounds = true
        mainImageView.tintColor = ColorsConstants.imageColor
        mainImageView.backgroundColor = ColorsConstants.viewColor
        mainImageView.alpha = 0.7
        
        mainImageView.image = UIImage(named: "defaultImage")
        
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
        updateButtonConstraints()
    }
    
    func setupShareButton(){
        view.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(didPressShareButton), for: .touchUpInside)
        let imageName = ImageConstants.shareImageName
        let symbolPointSize: CGFloat = 32
        let buttonColor = ColorsConstants.shareButtonColor
        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            shareButton.setImage(symbolImage, for: .normal)
            shareButton.tintColor = buttonColor
        }
        
        let buttonSize:CGFloat = 64
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: mainHeaderLaber.topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: mainHeaderLaber.leadingAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: buttonSize),
            shareButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    @objc func didPressShareButton(){
        guard let image = mainImageView.image else {
            return
        }
        output.didPressShareButton(image: image)
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
        
        magicButtonSpringConstraint = NSLayoutConstraint(item: magicButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(magicButtonSpringConstraint)
        let buttonSize:CGFloat = view.frame.width / 4
        NSLayoutConstraint.activate([
            magicButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 128),
            magicButton.heightAnchor.constraint(equalToConstant: buttonSize),
            magicButton.widthAnchor.constraint(equalToConstant: buttonSize),
        ])
    }
    
    @objc func didPressMagicButton(){
        animateForMagicButtonTap()
        guard let image = mainImageView.image else { return }
        output.didPressMagicButton(image: image)
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
        
        photosButtonSpringConstraint = NSLayoutConstraint(item: photosButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: -100)
        view.addConstraint(photosButtonSpringConstraint)
        let buttonSize:CGFloat = view.frame.width / 8
        NSLayoutConstraint.activate([
            photosButton.centerYAnchor.constraint(equalTo: magicButton.centerYAnchor),
            photosButton.heightAnchor.constraint(equalToConstant: buttonSize),
            photosButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    @objc func didPressPhotosButton(){
        print(#function)
        output.didPressPhotosButton()
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
        
        cameraButtonSpringConstraint = NSLayoutConstraint(item: cameraButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 100)
        view.addConstraint(cameraButtonSpringConstraint)
        let buttonSize:CGFloat = view.frame.width / 8
        NSLayoutConstraint.activate([
            cameraButton.centerYAnchor.constraint(equalTo: magicButton.centerYAnchor),
            cameraButton.heightAnchor.constraint(equalToConstant: buttonSize),
            cameraButton.widthAnchor.constraint(equalToConstant: buttonSize),
        ])
    }
    
    @objc func didPressCameraButton(){
        output.didPressCameraButton()
        updateButtonConstraints()
    }
}

extension MainViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            mainImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: MainViewInput {
    func configure(with image: UIImage) {
        mainImageView.image = image
    }
}

// MARK: AnimateForButtons
private extension MainViewController{
    func updateButtonConstraints(){
        magicButtonSpringConstraint.constant -= view.bounds.width
        photosButtonSpringConstraint.constant -= view.bounds.width
        cameraButtonSpringConstraint.constant -= view.bounds.width
    }
    
    func makeAppearButtonsAnimate(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut){
            self.cameraButtonSpringConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut){
            self.photosButtonSpringConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut){
            self.magicButtonSpringConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
    }
    
    func animateForMagicButtonTap(){
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        emitterLayer.emitterShape = .point
        
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "animate")?.cgImage
        cell.birthRate = 1
        cell.lifetime = 1
        cell.velocity = 1
        cell.scale = CGFloat(Float.random(in: 0.45...0.7))
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.fromValue = 1.2
        fadeOutAnimation.toValue = 0.0
        fadeOutAnimation.duration = 1.2
        emitterLayer.add(fadeOutAnimation, forKey: "fadeOut")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            emitterLayer.removeFromSuperlayer()
        }
        
        let bounds = magicButton.bounds
        guard let imageFrame = magicButton.imageView?.frame else {
            return
        }
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10,
            options: .curveEaseInOut){
                self.magicButton.bounds = CGRect(
                    x: bounds.origin.x - 30,
                    y: bounds.origin.y,
                    width: bounds.width + 50,
                    height: bounds.height)
                self.magicButton.imageView?.frame = CGRect(
                    x: imageFrame.origin.x + imageFrame.width,
                    y: imageFrame.origin.y,
                    width: imageFrame.width * 1.5,
                    height: imageFrame.height * 1.5)
            }
    }
}
