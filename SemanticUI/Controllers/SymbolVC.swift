//
//  SymbolVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/9/22.
//

import UIKit

class SymbolVC: UIViewController {
    
    var symbolImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSymbolImageView()
    }
    
    func configureSymbolImageView(){
        symbolImageView.contentMode = .scaleAspectFit
        view.addSubview(symbolImageView)
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: K.padding),
            symbolImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.padding),
            symbolImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.padding),
            symbolImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -K.padding)
        ])
        
    }
}
