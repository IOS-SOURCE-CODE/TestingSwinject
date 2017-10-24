//
//  Product.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductDTO: Mappable {
    
    var name:String?
    var image:String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name    <-     map["SUB_TITLE_EN"]
        image   <-     map["FRONT_IMAGE_URI"]
    }
}
