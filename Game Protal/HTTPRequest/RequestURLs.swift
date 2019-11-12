//
//  RequestURLs.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation

struct RequestURLs {
    
    private static let baseUrl = "https://api.rawg.io/api/"
    
    public static func gamesUrl(pageSize: Int, page: Int) -> String {
        return baseUrl + "games?page_size=\(pageSize)&page=\(page)"
    }
    
    public static func gamesUrl(pageSize: Int, page: Int, searchText: String) -> String {
        return baseUrl + "games?page_size=\(pageSize)&page=\(page)&search=\(searchText)"
    }
    
    public static func gameDetailsUrl(gameId: Int) -> String {
        return baseUrl + "games/\(gameId)"
    }
}
