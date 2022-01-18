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
    
    private var username: String = ""
    private var password: String = ""
    private var email: String = ""
    
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
        getData()
    }
}

extension LogInViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
    }
    
    private func addSubViews() {
        addScrollView()
        addStackView()
        addLogInButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
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
        logInButton.topToBottom(of: scrollView).constant = 20
        logInButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 20, right: 20), usingSafeArea: true)
    }
    
    private func getData() {
        guard let username = UserDefaultsManager.shared.getData(key: KeyIdentifier.username) as? String,
              let email = UserDefaultsManager.shared.getData(key: KeyIdentifier.email) as? String,
              let password = UserDefaultsManager.shared.getData(key: KeyIdentifier.password) as? String
        else { return }
        self.username = username
        self.email = email
        self.password = password
    }
    
    @objc
    func logIn() {
        guard usernameTextField.text == username,
              passwordTextField.text == password,
              emailTextField.text == email else {
                  return AlertViewGenerate(viewController: self,
                                           title: AlertIdentifier.error,
                                           message: AlertIdentifier.wrongData).generate()
              }
        let homePage = HomePageViewController()
        homePage.modalPresentationStyle = .fullScreen
        present(homePage, animated: true, completion: nil)
    }
    
}
