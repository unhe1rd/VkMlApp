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
        
        setupMainHeaderView()
        setupFaqButton()
        setupMainImageView()
    }
    
    func setupFaqButton(){
        view.addSubview(faqButton)
        faqButton.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        
        NSLayoutConstraint.activate([
            faqButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            faqButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            faqButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
        ])
    }
    
    func setupMainHeaderView(){
        view.addSubview(mainHeaderLaber)
        mainHeaderLaber.translatesAutoresizingMaskIntoConstraints = false
        mainHeaderLaber.textAlignment = .center
        mainHeaderLaber.font = UIFont(name: "AmericanTypewriter", size: 48)
        mainHeaderLaber.text = "Artify"
        
        NSLayoutConstraint.activate([
            mainHeaderLaber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            mainHeaderLaber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            mainHeaderLaber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
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
}

extension MainViewController: MainViewInput {
    func configure() {
        print(#function)
    }
}
