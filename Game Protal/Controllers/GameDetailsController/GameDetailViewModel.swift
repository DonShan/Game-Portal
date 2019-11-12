//
//  GameDetailViewModel.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import ObjectMapper

class GameDetailViewModel {
    
    var gameSummary: GameSummary!
    var gameDetail: GameDetail!
    
    init(gameSummary: GameSummary) {
        self.gameSummary = gameSummary
    }
    
    func fetchGameDetails(completion: @escaping ((GameDetail?) -> ()), error: @escaping ((String) -> ())) {
        
        HTTPRequests.shared.sendRequest(url: RequestURLs.gameDetailsUrl(gameId: Int(gameSummary!.id)), completion: { (response) in
            
            if let detail = Mapper<GameDetail>().map(JSONString: response!.rawString()!) {
                self.gameDetail = detail
            }
            completion(self.gameDetail)
        }) { (errorString) in
            error(errorString)
        }
    }
}
