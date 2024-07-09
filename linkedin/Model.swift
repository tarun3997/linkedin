//
//  Model.swift
//  linkedin
//
//  Created by Apple 17 on 27/06/24.

import Foundation
import ObjectMapper

class ModelMappable: Mappable {
    var name: String?
    var code: String?
    var emoji: String?
    var unicode: String?
    var image: String?

    required init?(map:Map){
        self.unicode = ""
    }

    func mapping(map:Map){
        name <- map["name"]
        code <- map["code"]
        emoji <- map["emoji"]
        unicode <- map["emoji"]
        image <- map["image"]
    }
}

