//
//  RouteUrl.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
import Alamofire

let HttpHeader:HTTPHeaders = [
    "Authorization":"Basic Z2wtcHJveHktd2Vic2VydmljZTpHbGZAZmluYW5jZTEyMw==",
    "Accept": "application/json"
]


enum RouteUrl: String {
    case productUrl = "https://solar.gl-f.com:8443/gl_mb_proxy_service/product/filter-by-model?page=1&limit=15";
}
