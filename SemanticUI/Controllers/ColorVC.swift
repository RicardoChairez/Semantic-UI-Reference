//
//  ColorVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/8/22.
//

import UIKit

class ColorVC: UIViewController {
    
    var uiColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureColorView()
    }
    
    func configureColorView(){
        let colorView = UIView()
        colorView.backgroundColor = uiColor
        colorView.layer.cornerRadius = K.padding

        view.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: K.padding),
            colorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.padding),
            colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.padding),
            colorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -K.padding)
        ])
        
    }
}
