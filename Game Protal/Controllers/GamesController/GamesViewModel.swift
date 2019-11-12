//
//  GamesViewModel.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class GamesViewModel {
    
    var currentPage = 1
    let pageSize = 100
    var nextPageUrl: String? = nil
    var gameSummeries: [GameSummary] = [] {
        didSet {
            filteredGameSummeries = gameSummeries
        }
    }
    var filteredGameSummeries: [GameSummary] = []
    var isFetching = false
    
    init() {
        nextPageUrl = RequestURLs.gamesUrl(pageSize: pageSize, page: currentPage)
    }
    
    func fetchGames(completion: @escaping (([GameSummary]?) -> ()), error: @escaping ((String) -> ())) {
        
        if isFetching { return }
        isFetching = true
        HTTPRequests.shared.sendRequest(url: RequestURLs.gamesUrl(pageSize: pageSize, page: currentPage), completion: { (response) in
            self.isFetching = false
            if let nextPage = response!["next"].string {
                self.nextPageUrl = nextPage
            }
            if let summeries = Mapper<GameSummary>().mapArray(JSONString: response!["results"].rawString()!) {
                self.gameSummeries.append(contentsOf: summeries)
            }
            completion(self.gameSummeries)
        }) { (errorString) in
            self.isFetching = false
            error(errorString)
        }
    }
    
    func clearAll() {
        self.gameSummeries = []
        self.filteredGameSummeries = []
    }
}
