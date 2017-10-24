//
//  NetworkLayer.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
import Alamofire

typealias DataBlock = (Data) -> ()

protocol NetworkLayer {
    func getFromServer(finished:  @escaping DataBlock)
}


class NetworkLayerImpl: NetworkLayer {
    
    func getFromServer(finished: @escaping (Data) -> ()) {
        
        Alamofire.request(RouteUrl.productUrl.rawValue)
            .responseJSON
            { response in
                
                guard let data = response.data else { return }
                finished(data)
        }
    }
}
