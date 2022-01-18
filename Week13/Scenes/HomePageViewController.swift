//
//  HomePageViewController.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import UIKit
import MobilliumBuilders

class HomePageViewController: UIViewController {

    private let welcomeLabel = UILabelBuilder()
        .text("Welcome to the Week13 app.")
        .textColor(.white)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addSubViews()
    }
    
    private func addSubViews() {
        view.addSubview(welcomeLabel)
        welcomeLabel.centerInSuperview()
    }
}
