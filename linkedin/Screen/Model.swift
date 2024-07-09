//
//  Model.swift
//  linkedin
//
//  Created by Apple 3 on 27/06/24.
//

import Foundation
import ObjectMapper

class modelMappable: Mappable {
    var name: String?
    var code: String?
    var emoji: String?
    var unicode: String
    var image: String?

    required init?(map: Map) {
        self.unicode = ""
    }
    
    func mapping(map: Map) {
        name    <- map["Ascension island"]
        code    <- map["AC"]
        emoji   <- map["rf"]
        unicode <- map["U+1F1E6 U+1F1EB"]
        image   <- map["https//cdn.jsdelivr.net/npm/country-flag-emoji-jason@20.0/images/AC.svg"]
    }
}


//         "name": "Ascension island",
//        "code": "AC",
//        "emoji": "rf",
//        "unicode": "U+1F1E6 U+1F1EB",
//        "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-jason@20.0/images/AC.svg"
//
class Countrylist : Mappable{
    var countylist : [Countrylist]?
    
   required  init?(map: Map){
        
    }
 
    func mapping(map: Map) {
    countylist <- map["Countrylist"]
    }
}
