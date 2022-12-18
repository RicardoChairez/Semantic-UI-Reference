//
//  UIViewController+Ext.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/9/22.
//

import UIKit

extension UIViewController{
    @objc func presentSettings(){
        let settingsVC = SettingsVC()
        settingsVC.title = "Settings"
        let navigationController = UINavigationController(rootViewController: settingsVC)
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true)
    }
}
