//
//  FontsVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/7/22.
//

import UIKit

class FontsVC: UIViewController {
    
    var fontTableView = UITableView()
    var segmentedControl = UISegmentedControl()
    var fonts: [Font] = []
    
    let textStyleFonts: [Font] = [
        Font(name: "largeTitle", font: UIFont.preferredFont(forTextStyle: .largeTitle)),
        Font(name: "title1", font: UIFont.preferredFont(forTextStyle: .title1)),
        Font(name: "title2", font: UIFont.preferredFont(forTextStyle: .title2)),
        Font(name: "title3", font: UIFont.preferredFont(forTextStyle: .title3)),
        Font(name: "headline", font: UIFont.preferredFont(forTextStyle: .headline)),
        Font(name: "subheadline", font: UIFont.preferredFont(forTextStyle: .subheadline)),
        Font(name: "body", font: UIFont.preferredFont(forTextStyle: .body)),
        Font(name: "callout", font: UIFont.preferredFont(forTextStyle: .callout)),
        Font(name: "footnote", font: UIFont.preferredFont(forTextStyle: .footnote)),
        Font(name: "caption1", font: UIFont.preferredFont(forTextStyle: .caption1)),
        Font(name: "caption2", font: UIFont.preferredFont(forTextStyle: .caption2))
    ]
    
    let weightFonts: [Font] = [
        Font(name: "ultraLight", font: UIFont.systemFont(ofSize: 28, weight: .ultraLight)),
        Font(name: "thin", font: UIFont.systemFont(ofSize: 28, weight: .thin)),
        Font(name: "light", font: UIFont.systemFont(ofSize: 28, weight: .light)),
        Font(name: "regular", font: UIFont.systemFont(ofSize: 28, weight: .regular)),
        Font(name: "medium", font: UIFont.systemFont(ofSize: 28, weight: .medium)),
        Font(name: "semibold", font: UIFont.systemFont(ofSize: 28, weight: .semibold)),
        Font(name: "bold", font: UIFont.systemFont(ofSize: 28, weight: .bold)),
        Font(name: "heavy", font: UIFont.systemFont(ofSize: 28, weight: .heavy)),
        Font(name: "black", font: UIFont.systemFont(ofSize: 28, weight: .black))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        fonts = textStyleFonts
        configureVC()
        configureSegmentedControl()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fontTableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
    }
    override func viewDidLayoutSubviews() {
        configureTableViewHeader()
    }
    
    @objc func toggleFonts(){
        if fonts[0].name == textStyleFonts[0].name{
            fonts = weightFonts
        }
        else{
            fonts = textStyleFonts
        }
        fontTableView.reloadData()
    }
    
    func configureVC(){
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(self.presentSettings))
    }
    
    func configureSegmentedControl(){
        segmentedControl.insertSegment(withTitle: "Text style", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Weight", at: 1, animated: true)
        segmentedControl.addTarget(self, action: #selector(toggleFonts), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTableView(){
        fontTableView.dataSource = self
        fontTableView.delegate = self
        fontTableView.backgroundColor = .clear
        fontTableView.rowHeight = 77
        
        view.addSubview(fontTableView)
        fontTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fontTableView.topAnchor.constraint(equalTo: view.topAnchor),
            fontTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fontTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fontTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureTableViewHeader(){
        fontTableView.tableHeaderView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: fontTableView.bounds.width, height: 50)))
        fontTableView.tableHeaderView?.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: fontTableView.tableHeaderView!.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: fontTableView.tableHeaderView!.leadingAnchor, constant: K.padding),
            segmentedControl.trailingAnchor.constraint(equalTo: fontTableView.tableHeaderView!.trailingAnchor, constant: -K.padding),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension FontsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FontTableViewCell()
        cell.set(font: fonts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fontVC = FontVC()
        let font = fonts[indexPath.row]
        fontVC.title = font.name
        fontVC.font = font.font
        navigationController?.pushViewController(fontVC, animated: true)
    }
}


