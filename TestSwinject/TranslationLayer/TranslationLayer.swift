//
//  TranslationLayer.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation


protocol TranslationLayer {
    func createDTOFromJSONData (data: Data) -> [ProductDTO]
}

class TranslationLayerImpl: TranslationLayer {
    
    func createDTOFromJSONData (data: Data) -> [ProductDTO] {
        do {
            
            let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
            let json = jsonData!["RSLT_DATA"] as! NSArray
            let products = json.flatMap {  dto in
                ProductDTO(JSON: dto as! [String : Any])
            }
            return products
            
        } catch {
            
            fatalError("No Data or cannot convert")
            
        }
        
    }
}
