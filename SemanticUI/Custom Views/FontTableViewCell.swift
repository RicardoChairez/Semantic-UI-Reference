//
//  FontTableViewCell.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/11/22.
//

import UIKit

class FontTableViewCell: UITableViewCell {
    let fontLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureColorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        backgroundColor = .secondarySystemGroupedBackground
        accessoryType = .disclosureIndicator
    }
    
    func set(font: Font){
        fontLabel.text = font.name
        fontLabel.font = font.font
    }
    
    func configureColorLabel(){
        fontLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(fontLabel)
        fontLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fontLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: K.padding),
            fontLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            fontLabel.topAnchor.constraint(equalTo: self.topAnchor),
            fontLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

