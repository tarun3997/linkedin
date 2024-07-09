//
//  model.swift
//  linkedin
//
//  Created by FCP30 on 27/06/24.
//

import Foundation
import ObjectMapper

class modelMappable: Mappable {
    var name: String?
    var code: String?
    var emoji: String?
    var unicode: String?
    var image: String?
    
    required init?(map: Map) {
        self.unicode = ""
    }
    func mapping(map: Map) {
        name  <- map["name"]
        code  <- map["code"]
        emoji  <- map["emoji"]
        unicode <- map["unicode"]
        image <- map["image"]
    }
}


import Foundation
import ObjectMapper

class CountryList: Mappable{
    var name: String?
    var code: String?
    var emoji: String?
    var unicode: String?
    var image: String?
    
    required init?(map: Map) {
    }
    
        func mapping(map: Map) {
            name  <- map["name"]
            code  <- map["code"]
            emoji  <- map["emoji"]
            unicode <- map["unicode"]
            image <- map["image"]
      
    }
}

class CountryLists : Mappable {
    var CountryList : [CountryList]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        CountryList <- map["CountryList"]
    }
}
