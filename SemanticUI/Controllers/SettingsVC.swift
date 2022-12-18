//
//  SettingsVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/9/22.
//

import UIKit

class SettingsVC: UIViewController {
    
    let segmentedControl = UISegmentedControl()
    let appearanceLabel = UILabel()
    
    private static var interFaceStyle = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureAppearanceLabel()
        configureSegmentedControl()
    }
    
    @objc func segmentSelected(){
        let window = view.window?.windowScene?.keyWindow
        if(segmentedControl.selectedSegmentIndex == 0){
            SettingsVC.interFaceStyle = 0
            window?.overrideUserInterfaceStyle = .light
        }
        else if(segmentedControl.selectedSegmentIndex == 1){
            SettingsVC.interFaceStyle = 1
            window?.overrideUserInterfaceStyle = .unspecified
        }
        else{
            SettingsVC.interFaceStyle = 2
            window?.overrideUserInterfaceStyle = .dark
        }
    }
    
    func configureVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    }
    
    func configureAppearanceLabel(){
        appearanceLabel.text = "APPEARANCE"
        appearanceLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        appearanceLabel.textColor = .secondaryLabel
        
        appearanceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appearanceLabel)
        NSLayoutConstraint.activate([
            appearanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appearanceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.padding),
            appearanceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureSegmentedControl(){
        segmentedControl.insertSegment(withTitle: "Light", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "System", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Dark", at: 2, animated: true)
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = SettingsVC.interFaceStyle
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: appearanceLabel.bottomAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: K.padding),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -K.padding),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}
