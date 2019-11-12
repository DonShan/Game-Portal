//
//  GamesController.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class GamesController: UIViewController {
    
    //MARK: Properties
    var viewModel = GamesViewModel()
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: GameTableViewCell.self))
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        loadGames()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func loadGames() {
        self.viewModel.clearAll()
        self.tableView.reloadData()
        self.viewModel.fetchGames(completion: { (games) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
}

extension GamesController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GameTableViewCell.self)) as! GameTableViewCell
        cell.setGameObject(gameObject: self.viewModel.filteredGameSummeries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.filteredGameSummeries.count
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let row = indexPaths.first else { return }
        if row.row > self.viewModel.filteredGameSummeries.count {
            self.loadGames()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "GameDetailController") as! GameDetailController
        vc.viewModel = GameDetailViewModel(gameSummary: self.viewModel.filteredGameSummeries[indexPath.row])
        vc.viewModel.fetchGameDetails(completion: { (gameDetail) in
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (error) in
            
        }
    }
}


extension GamesController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchText == "" {
            self.viewModel.filteredGameSummeries = self.viewModel.gameSummeries
        } else {
            self.viewModel.filteredGameSummeries = self.viewModel.gameSummeries.filter({$0.name!.contains(searchText)})
        }
        self.tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text!.isEmpty || searchBar.text! == "" {
            self.viewModel.filteredGameSummeries = self.viewModel.gameSummeries
        } else {
            self.viewModel.filteredGameSummeries = self.viewModel.gameSummeries.filter({$0.name!.contains(searchBar.text!)})
        }
        self.tableView.reloadData()
    }
}
