//
//  Structs.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import ObjectMapper
import Realm
import RealmSwift
import ObjectMapper_Realm

class GameSummary: Object, Mappable  {
    
    @objc dynamic var id: Int64 = 0
    @objc dynamic var slug: String?
    @objc dynamic var name: String?
    @objc dynamic var released: String?
    var tba: Bool? = false
    @objc dynamic var backgroundImage: String?
    @objc dynamic var rating: Double = 0
    @objc dynamic var ratingTop: Int = 0
    @objc dynamic var ratingsCount: Int = 0
    @objc dynamic var reviews_text_count: Int = 0
    @objc dynamic var added: Int = 0
    @objc dynamic var metacritic: Int = 0
    @objc dynamic var playtime: Int = 0
    @objc dynamic var suggestionsCount: Int64 = 0
    @objc dynamic var reviewsCount: Int64 = 0
    @objc dynamic var saturatedColor: Int64 = 0
    @objc dynamic var dominantColor: String?
    dynamic var genres = [Genre]()
    
    func mapping(map: Map) {
        
        id <- map["id"]
        slug <- map["slug"]
        name <- map["name"]
        released <- map["released"]
        tba <- map["tba"]
        backgroundImage <- map["background_image"]
        rating <- map["rating"]
        ratingTop <- map["rating_top"]
        ratingsCount <- map["ratings_count"]
        reviews_text_count <- map["reviews_text_count"]
        added <- map["added"]
        metacritic <- map["metacritic"]
        playtime <- map["playtime"]
        suggestionsCount <- map["suggestions_count"]
        reviewsCount <- map["reviews_count"]
        saturatedColor <- map["saturated_color"]
        dominantColor <- map["dominant_color"]
        genres <- map["genres"]
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}

//"id": 4,
//"name": "Action",
//"slug": "action",
//"games_count": 76581,
//"image_background": "https://media.rawg.io/media/games/490/49016e06ae2103881ff6373248843069.jpg"

class Genre: Object, Mappable {
    
    @objc dynamic var id: Int64 = 0
    @objc dynamic var name: String?
    @objc dynamic var slug: String?
    var gamesCount: Int = 0
    @objc dynamic var imageBackground: String?
    
    func mapping(map: Map) {
        
        id <- map["id"]
        slug <- map["slug"]
        name <- map["name"]
        gamesCount <- map["games_count"]
        imageBackground <- map["image_background"]
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
