//
//  LogInViewController.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

class LogInViewController: UIViewController {
    
    private let scrollView = UIScrollViewBuilder()
        .bounces(true)
        .build()
    
    private let contentView = UIViewBuilder().build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(20)
        .build()
    
    private let usernameTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Username")
        .build()
    
    private let emailTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Email")
        .build()
    
    private let passwordTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Password")
        .isSecureTextEntry(true)
        .build()
    
    private let logInButton = UIButtonBuilder()
        .title("Log In")
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        //        getData()
        addActions()
    }
}

//MARK: - Contents
extension LogInViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
    }
}

//MARK: - SubViews
extension LogInViewController {
    
    private func addSubViews() {
        addScrollView()
        addStackView()
        addLogInButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addStackView() {
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .top(50) + .left(20) + .right(20))
        contentStackView.addArrangedSubview(usernameTextField)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(passwordTextField)
    }
    
    private func addLogInButton() {
        self.view.addSubview(logInButton)
        logInButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 20, right: 20), usingSafeArea: true)
    }
}

//MARK: - Actions
extension LogInViewController {
    
    private func addActions() {
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func logInButtonTapped() {
        // Read/Get Data
        guard let data = UserDefaults.standard.data(forKey: "user") else { return }
        
        do {
            // Create JSON Decoder
            let decoder = JSONDecoder()
            
            // Decode Note
            let data = try decoder.decode(User.self, from: data)
            
            guard usernameTextField.text == data.username,
                  emailTextField.text == data.email,
                  passwordTextField.text == data.password
            else {
                return AlertViewGenerate.shared
                    .setViewController(self)
                    .setTitle(AlertIdentifier.error)
                    .setMessage(AlertIdentifier.wrongData)
                    .generate()
            }
            // Segue
            let homePage = HomePageViewController()
            homePage.modalPresentationStyle = .fullScreen
            present(homePage, animated: true, completion: nil)
        } catch {
            print("Unable to Decode Notes (\(error))")
        }
    }
}
