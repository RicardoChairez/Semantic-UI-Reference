//
//  ColorTableViewCell.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/8/22.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    let colorView = UIView()
    let colorLabel = UILabel()

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
    
    func set(color: Color){
        colorView.backgroundColor = color.uiColor
        colorLabel.text = color.name
    }
    
    func configureColorView(){
        colorView.backgroundColor = .label
        colorView.layer.cornerRadius = 10
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: K.padding),
            colorView.topAnchor.constraint(equalTo: self.topAnchor, constant:  5),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            colorView.widthAnchor.constraint(equalTo: colorView.heightAnchor)
        ])
    }
    
    func configureColorLabel(){
        colorLabel.adjustsFontSizeToFitWidth = true
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorLabel)
        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: 10),
            colorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorLabel.topAnchor.constraint(equalTo: self.topAnchor),
            colorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
