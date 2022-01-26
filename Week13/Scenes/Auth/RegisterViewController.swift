//
//  ViewController.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 5.01.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

class RegisterViewController: UIViewController {
    
    private let scrollView = UIScrollViewBuilder()
        .bounces(true)
        .build()
    
    private let contentView = UIViewBuilder().build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(20)
        .build()
    
    private let nameTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Name")
        .build()
    
    private let surnameTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Surname")
        .build()
    
    private let emailTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Email")
        .build()
    
    private let usernameTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Username")
        .build()
    
    private let passwordTextField = UITextFieldBuilder()
        .borderWidth(1)
        .placeholder("Password")
        .isSecureTextEntry(true)
        .build()
    
    private let registerButton = UIButtonBuilder()
        .title("Register")
        .build()
    
    private let logInButton = UIButtonBuilder()
        .title("Log In")
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        addActions()
    }
}

//MARK: - Contents
extension RegisterViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
    }
}

//MARK: - SubViews
extension RegisterViewController {
    
    private func addSubViews() {
        addScrollView()
        addStackView()
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
        contentStackView.addArrangedSubview(nameTextField)
        contentStackView.addArrangedSubview(surnameTextField)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(usernameTextField)
        contentStackView.addArrangedSubview(passwordTextField)
        contentStackView.addArrangedSubview(registerButton)
        contentStackView.addArrangedSubview(logInButton)
    }
}

//MARK: - Actions
extension RegisterViewController {
    
    private func addActions() {
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func logInButtonTapped() {
        let nextViewController = LogInViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    @objc
    func registerButtonTapped() {
        guard let name = nameTextField.text, name.isEmpty != true,
              let surname = surnameTextField.text, surname.isEmpty != true,
              let email = emailTextField.text, email.isEmpty != true,
              let username = usernameTextField.text, username.isEmpty != true,
              let password = passwordTextField.text, password.isEmpty != true
        else {
            return AlertViewGenerate.shared
                .setViewController(self)
                .setTitle(AlertIdentifier.error)
                .setMessage(AlertIdentifier.missingData)
                .generate()
        }
        
        let user = UserBuilder()
            .setName(name)
            .setSurname(surname)
            .setEmail(email)
            .setUserName(username)
            .setPassword(password)
            .build()
        
        if UserDefaultsManager.shared.setData(object: user, key: "user") {
            // Success Alert
            AlertViewGenerate.shared
                .setViewController(self)
                .setTitle(AlertIdentifier.great)
                .setMessage(AlertIdentifier.success)
                .generate()
        }
    }
}

