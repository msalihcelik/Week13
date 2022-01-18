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
    }
}

extension RegisterViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        logInButton.addTarget(self, action: #selector(segueLogIn), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
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
    
    @objc
    func segueLogIn() {
        let nextViewController = LogInViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    @objc
    func registerButtonTapped() {
        guard let name = nameTextField.text,
              let surname = surnameTextField.text,
              let email = emailTextField.text,
              let username = usernameTextField.text,
              let password = passwordTextField.text
        else { return }
        
        if (name.isEmpty || surname.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty) {
            AlertViewGenerate(viewController: self,
                              title: AlertIdentifier.error,
                              message: AlertIdentifier.missingData).generate()
        } else {
            let user = UserBuilder()
                .setName(name)
                .setSurname(surname)
                .setEmail(email)
                .setUserName(username)
                .setPassword(password)
                .build()
            UserDefaultsManager.shared.setData(value: user.name, key: KeyIdentifier.name)
            UserDefaultsManager.shared.setData(value: user.surname, key: KeyIdentifier.surname)
            UserDefaultsManager.shared.setData(value: user.email, key: KeyIdentifier.email)
            UserDefaultsManager.shared.setData(value: user.username, key: KeyIdentifier.username)
            UserDefaultsManager.shared.setData(value: user.password, key: KeyIdentifier.password)
            AlertViewGenerate(viewController: self,
                              title: AlertIdentifier.great,
                              message: AlertIdentifier.success).generate()
        }
    }
    
}

