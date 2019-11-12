//
//  Classes.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import ObjectMapper

class GameDetail: Mappable {
    
    var description: String?
    var name: String?
    var redditUrl: String?
    var website: String?
    var gbImage: String?
    
    func mapping(map: Map) {
        
        description <- map["description"]
        name <- map["name_original"]
        redditUrl <- map["reddit_url"]
        website <- map["website"]
        gbImage <- map["background_image"]
    }
    
    required init?(map: Map) {
        
    }
}
