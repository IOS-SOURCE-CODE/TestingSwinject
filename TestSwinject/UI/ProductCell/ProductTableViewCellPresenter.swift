//
//  ProductTableViewCellPresenter.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation

protocol ProductTableViewPresenter {
    
    var name: String { get }
    var image: String { get }
}

class ProductTableViewPresenterImpl: ProductTableViewPresenter {
    
    var product: ProductDTO
    
    var name:String { return product.name! }
    var image:String { return product.image! }
    
    init(with product: ProductDTO) {
        self.product = product
    }
}
