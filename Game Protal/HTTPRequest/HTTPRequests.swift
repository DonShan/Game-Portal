//
//  HTTPRequests.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HTTPRequests {
    
    static let shared = HTTPRequests()
    
    func sendRequest(url: String, completion: @escaping ((JSON?) -> ()), error: @escaping ((String) -> ())) {
        
        guard let url = URL(string: url) else {
          completion(nil)
          return
        }
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseJSON { (dataResponse) in
            if let response = dataResponse.value {
                let json = JSON(response)
                completion(json)
            } else if let errorObj = dataResponse.error {
                let errorString = errorObj.localizedDescription
                error(errorString)
            }
        }
    }
}
