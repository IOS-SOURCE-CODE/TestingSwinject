//
//  ModelLayer.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation

typealias BlockandSource = (_ productDTO: [ProductDTO]) -> ()
protocol ModelLayer {
    
    func getData(resultsLoaded: @escaping (BlockandSource))
}

class ModelLayerImpl: ModelLayer {
    
    fileprivate var translationLayer: TranslationLayer
    fileprivate var networklayer: NetworkLayer
    
    init(with networkLayer: NetworkLayer, translation:TranslationLayer) {
        self.networklayer = networkLayer
        self.translationLayer = translation
    }
    
    func getData(resultsLoaded: @escaping BlockandSource) {
        
        networklayer.getFromServer { (data) in
            let json = self.translationLayer.createDTOFromJSONData(data: data)
            resultsLoaded(json)
        }
    }
}
