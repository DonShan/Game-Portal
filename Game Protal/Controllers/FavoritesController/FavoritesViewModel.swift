//
//  FavoritesViewModel.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    var favorites: [GameSummary] = []
    
    func fetchData() {
        favorites = PersistantStorage.shared.getAll()
    }
}
