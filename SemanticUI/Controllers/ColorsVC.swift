//
//  ColorsVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/7/22.
//

import UIKit

class ColorsVC: UIViewController {
    
    var colorTableView = UITableView()
    var colorSegmentedControl = UISegmentedControl()
    var colors: [ColorGroup] = []
    let standardColors = [
        ColorGroups.adaptableColorsGroup,
        ColorGroups.adaptableGraysGroup,
        ColorGroups.fixedColorsGroup
    ]
    let uiColors = [
        ColorGroups.labelColorsGroup,
        ColorGroups.fillColorsGroup,
        ColorGroups.textColorsGroup,
        ColorGroups.tintColorsGroup,
        ColorGroups.standardContentBackgroundColorsGroup,
        ColorGroups.groupedContentBackgroundColorsGroup,
        ColorGroups.separatorColorsGroup,
        ColorGroups.linkColorsGroup,
        ColorGroups.nonadaptableColorsGroup
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        colors = standardColors
        configureVC()
        configureSegmentedControl()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        colorTableView.selectRow(at: nil, animated: true, scrollPosition: .none)
    }
    override func viewDidLayoutSubviews() {
        configureTableViewHeader()
    }

    
    @objc func toggleColorGroup(){
        if colors[0].name == standardColors[0].name{
            colors = uiColors
        }
        else{
            colors = standardColors
        }
        colorTableView.reloadData()
    }
    
    func configureVC(){
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(self.presentSettings))
    }
    
    func configureSegmentedControl(){
        colorSegmentedControl.insertSegment(withTitle: "Standard", at: 0, animated: true)
        colorSegmentedControl.insertSegment(withTitle: "UI elements", at: 1, animated: true)
        colorSegmentedControl.addTarget(self, action: #selector(toggleColorGroup), for: .valueChanged)
        colorSegmentedControl.selectedSegmentIndex = 0
        colorSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTableView(){
        colorTableView.dataSource = self
        colorTableView.delegate = self
        colorTableView.backgroundColor = .clear
        colorTableView.rowHeight = 61
        
        view.addSubview(colorTableView)
        colorTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorTableView.topAnchor.constraint(equalTo: view.topAnchor),
            colorTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureTableViewHeader(){
        colorTableView.tableHeaderView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: colorTableView.bounds.width, height: 30)))
        colorTableView.tableHeaderView?.addSubview(colorSegmentedControl)
        NSLayoutConstraint.activate([
            colorSegmentedControl.topAnchor.constraint(equalTo: colorTableView.tableHeaderView!.topAnchor),
            colorSegmentedControl.leadingAnchor.constraint(equalTo: colorTableView.tableHeaderView!.leadingAnchor, constant: K.padding),
            colorSegmentedControl.trailingAnchor.constraint(equalTo: colorTableView.tableHeaderView!.trailingAnchor, constant: -K.padding),
            colorSegmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

//MARK: - TableView
//
extension ColorsVC: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors[section].colors.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return colors[section].name
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ColorTableViewCell(style: .default, reuseIdentifier: "Chip")
        cell.set(color: colors[indexPath.section].colors[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.section].colors[indexPath.row]
        let colorVC = ColorVC()
        colorVC.title = color.name
        colorVC.uiColor = color.uiColor
        navigationController?.pushViewController(colorVC, animated: true)
    }
}
