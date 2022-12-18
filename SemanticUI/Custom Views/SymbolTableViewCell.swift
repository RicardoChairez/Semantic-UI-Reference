//
//  SymbolTableViewCell.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/9/22.
//

import UIKit

class SymbolTableViewCell: UITableViewCell {
    let symbolImageView = UIImageView()
    let symbolLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureColorView()
        configureColorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        backgroundColor = .secondarySystemGroupedBackground
        accessoryType = .disclosureIndicator
    }
    
    func set(symbolString: String){
        symbolImageView.image = UIImage(systemName: symbolString)
        symbolLabel.text = symbolString
    }
    
    func configureColorView(){
        symbolImageView.contentMode = .scaleAspectFit
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(symbolImageView)
        NSLayoutConstraint.activate([
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: K.padding),
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant:  5),
            symbolImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            symbolImageView.widthAnchor.constraint(equalTo: symbolImageView.heightAnchor)
        ])
    }
    
    func configureColorLabel(){
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.numberOfLines = 2
        self.addSubview(symbolLabel)
        NSLayoutConstraint.activate([
            symbolLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 10),
            symbolLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -K.padding),
            symbolLabel.topAnchor.constraint(equalTo: self.topAnchor),
            symbolLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
