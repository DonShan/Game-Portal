//
//  FavoritesController.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
    
    var viewModel: FavoritesViewModel!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FavoritesViewModel()
        self.tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: GameTableViewCell.self))
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.viewModel.fetchData()
        self.tableView.reloadData()
        self.lblTitle.text = "Favorites(\(self.viewModel.favorites.count))"
    }

}

extension FavoritesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GameTableViewCell.self)) as! GameTableViewCell
        cell.setGameObject(gameObject: self.viewModel.favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.favorites.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            PersistantStorage.shared.delete(item: self.viewModel.favorites[indexPath.row])
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.viewModel.fetchData()
                self.tableView.reloadData()
            }
        }
    }
}
