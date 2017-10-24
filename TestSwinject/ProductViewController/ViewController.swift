//
//  ViewController.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var productListPresenter: ProductListPresenter!
    fileprivate var productCellMaker: DependencyRegistry.productCellMaker!
    
    func configure(with productListPresenter: ProductListPresenter, productCellMaker: @escaping DependencyRegistry.productCellMaker) {
        self.productListPresenter = productListPresenter
        self.productCellMaker = productCellMaker
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        ProductTableViewCell.register(with: tableView)
        
        productListPresenter.loadData { [weak self] in
            self?.tableView.reloadData()
        }
        
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productListPresenter.data.count
    }
}


extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let dto = productListPresenter.data[indexPath.row]
        let cell = productCellMaker(tableView, indexPath, dto)
        return cell
    }
}
