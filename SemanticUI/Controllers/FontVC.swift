//
//  FontVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/10/22.
//

import UIKit

class FontVC: UIViewController {
    
    let label = UILabel()
    
    var font: UIFont!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureLabel()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
    }
    
    func configureVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: font ?? UIFont.labelFontSize,
        ]
    }
    
    func configureLabel(){
        label.text = "Did you ever think of a dream too big to imagine? Follow your passion, one day you'll face the law of attraction. Be careful what you ask for. I got what I asked for...exactly what I asked for."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.padding),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.padding),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
