//
//  DependencyRegistry.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
import Swinject

protocol DependencyRegistry  {
    
    var container: Container { get }
    
    typealias productCellMaker = (UITableView, IndexPath, ProductDTO) -> ProductTableViewCell
    func productCell(for tableView: UITableView, for indexPath: IndexPath, productDTO: ProductDTO) -> ProductTableViewCell
}

class DependencyRegistryImpl: DependencyRegistry {
    
    var container: Container
    
    init(container: Container) {
        self.container = container

        registerDependency()
        registerPresenter()
        registerViewController()
        
        print("DependencyRegistryImpl")
    }
    
    func registerDependency() {
        
        container.register(NetworkLayer.self) { _ in return NetworkLayerImpl() }.inObjectScope(.container)
        container.register(TranslationLayer.self) { _ in return TranslationLayerImpl() }.inObjectScope(.container)
        container.register(ModelLayer.self) { r in
            let networkLayer = r.resolve(NetworkLayer.self)!
            let translationLayer = r.resolve(TranslationLayer.self)!
        
            return ModelLayerImpl(with: networkLayer, translation: translationLayer)
        }.inObjectScope(.container)
    }
    
    
    func registerPresenter() {
        
        container.register(ProductListPresenter.self) { r in
            let modelLayer = r.resolve(ModelLayer.self)!
            return ProductListPresenterImpl(with: modelLayer)
        }.inObjectScope(.container)
        
        container.register(ProductTableViewPresenter.self) { (r, productDTO: ProductDTO) in return ProductTableViewPresenterImpl(with: productDTO) }.inObjectScope(.container)
    }
    
    
    func registerViewController() {
        
        
    }
    
     typealias productCellMaker = (UITableView, IndexPath, ProductDTO) -> ProductTableViewCell
    func productCell(for tableView: UITableView, for indexPath: IndexPath, productDTO: ProductDTO) -> ProductTableViewCell {
        let presenter = container.resolve(ProductTableViewPresenter.self, argument: productDTO)!
        let cell = ProductTableViewCell.dequeue(from: tableView, for: indexPath, with: presenter)
        return cell
    }
}
