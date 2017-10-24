//
//  ProductViewPresenter.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation

typealias VoidBlock = () -> ()


protocol ProductListPresenter {
    var data: [ProductDTO] { get }
    func loadData(finished: @escaping VoidBlock)
}

class ProductListPresenterImpl: ProductListPresenter {
    
    var data = [ProductDTO] ()
    
    fileprivate var modelLayer: ModelLayer
    
    init(with modelLayer: ModelLayer) {
        self.modelLayer = modelLayer
    }
}

extension ProductListPresenterImpl {
    
    func loadData(finished: @escaping VoidBlock) {
        self.modelLayer.getData { [weak self] productDTOs in
            self?.data = productDTOs
        }
    }
}
