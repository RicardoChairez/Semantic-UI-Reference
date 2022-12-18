//
//  SymbolsVC.swift
//  SemanticUI
//
//  Created by Chip Chairez on 8/7/22.
//

import UIKit

class SymbolsVC: UIViewController {
    
    let symbolSearchController = UISearchController()
    let symbolTableView = UITableView()
    var symbols: [String] = []
    var filteredSymbols: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        initializeSymbols()
        configureSearchController()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        symbolTableView.selectRow(at: nil, animated: true, scrollPosition: .none)
    }
    
    func configureVC(){
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(self.presentSettings))

    }
    
    func initializeSymbols(){
        symbols = SFSymbol.SFSymbolArray
        filteredSymbols = symbols
    }
    
    func configureSearchController(){
        symbolSearchController.searchResultsUpdater = self
        symbolSearchController.searchBar.autocorrectionType = .no
        symbolSearchController.searchBar.autocapitalizationType = .none
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = symbolSearchController
    }
    
    func configureTableView(){
        symbolTableView.dataSource = self
        symbolTableView.delegate = self
//        symbolTableView.separatorStyle = .singleLine
        symbolTableView.backgroundColor = .clear
        symbolTableView.rowHeight = 61
        
        view.addSubview(symbolTableView)
        symbolTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            symbolTableView.topAnchor.constraint(equalTo: view.topAnchor),
            symbolTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            symbolTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            symbolTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SymbolsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSymbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SymbolTableViewCell()
        cell.set(symbolString: filteredSymbols[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let symbol = filteredSymbols[indexPath.row]
        let symbolVC = SymbolVC()
        symbolVC.title = symbol
        symbolVC.symbolImageView.image = UIImage(systemName: filteredSymbols[indexPath.row])
        navigationController?.pushViewController(symbolVC, animated: true)
    }
}

extension SymbolsVC: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = symbolSearchController.searchBar.text, !text.isEmpty else {
            filteredSymbols = symbols
            symbolTableView.reloadData()
            return
        }
        filteredSymbols = symbols.filter { $0.contains(text.lowercased()) }
        symbolTableView.reloadData()
    }
}
