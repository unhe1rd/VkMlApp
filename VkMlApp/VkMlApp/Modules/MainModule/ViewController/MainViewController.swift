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
        view.backgroundColor = Constants.backgroundColor
        setupNavigationController()
        setupMainHeaderView()
        setupMainImageView()
        setupFaqButton()
    }
    
    func setupNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = Constants.backButtonColor
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
        mainImageView.tintColor = Constants.imageColor
        mainImageView.backgroundColor = Constants.viewColor
        mainImageView.alpha = 0.7
        
        let imageViewSize = view.frame.width - 32
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.topAnchor.constraint(equalTo: mainHeaderLaber.bottomAnchor, constant: 16),
            mainImageView.heightAnchor.constraint(equalToConstant: imageViewSize),
            mainImageView.widthAnchor.constraint(equalToConstant: imageViewSize)
        ])
    }
    
    func setupFaqButton(){
        view.addSubview(faqButton)
        faqButton.translatesAutoresizingMaskIntoConstraints = false
        faqButton.addTarget(self, action: #selector(didPressFaqButton), for: .touchUpInside)
        let imageName = "questionmark.circle"
        let symbolPointSize: CGFloat = 30
        let buttonColor = Constants.faqButtonColor
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
}

extension MainViewController: MainViewInput {
    func configure() {
        print(#function)
    }
}
