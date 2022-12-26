//
//  UIAlertController+showAlert.swift
//  ex 4.2 Viewcode-training-form
//
//  Created by jeovane.barbosa on 26/12/22.
//

import Foundation
import UIKit

extension UIAlertController {
    static func showAlert(withTitle title: String, andMessage message: String, fromController vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        vc.present(alert, animated: true)
    }
}
