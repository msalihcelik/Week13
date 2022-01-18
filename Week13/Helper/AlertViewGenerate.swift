//
//  AlertViewGenerate.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import Foundation
import UIKit

class AlertViewGenerate {
    
    let viewController: UIViewController
    let message: String
    let title: String
    
    init(viewController: UIViewController, title: String, message: String) {
        self.viewController = viewController
        self.message = message
        self.title = title
    }
    
    func generate() {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        viewController.present(alert, animated: true, completion: nil)
    }
}
