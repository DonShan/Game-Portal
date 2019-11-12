//
//  PersistantStorage.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class PersistantStorage {
    
    static let shared = PersistantStorage()
    
    func save(item: GameSummary) {
        
        let realm = try! Realm()
        let games = realm.objects(GameSummary.self)
        let filtered = games.filter({$0.id == item.id})
        if filtered.count == 0 {
            do {
                try realm.write {
                    realm.add(item)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func delete(item: GameSummary) {
        
        if item.isInvalidated { return }
        let realm = try! Realm()
        let games = realm.objects(GameSummary.self)
        if let filtered = games.filter({$0.id == item.id}).first {
            do {
                try realm.write {
                    realm.delete(filtered)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getAll() -> [GameSummary] {
        let realm = try! Realm()
        let games = realm.objects(GameSummary.self)
        return Array(games)
    }
}
