//
//  ProductTableViewCell.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    fileprivate var productTableViewPresenter: ProductTableViewPresenter!
    
    func configure(with productTableViewPresenter: ProductTableViewPresenter) {
        
        productNameLabel.text = productTableViewPresenter.name
    }
    
}

// MARK: Helper Method
extension ProductTableViewCell {
    
    public static var producTableViewCellId: String {
        return "ProductTableViewCell";
    }
    
    public static var bundle: Bundle {
        return Bundle(for: ProductTableViewCell.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: producTableViewCellId, bundle: bundle)
    }
    
    public static func register(with tableView: UITableView) {
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: producTableViewCellId)
    }
    
    public static func loadFromNib(owner: Any?) -> ProductTableViewCell {
        
        return bundle.loadNibNamed(producTableViewCellId, owner: owner, options: nil)?.first as! ProductTableViewCell
    }
    
    public static func dequeue(from tableView:UITableView, for indexPath: IndexPath, with presenter: ProductTableViewPresenter) -> ProductTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: producTableViewCellId, for: indexPath) as! ProductTableViewCell
        cell.configure(with: presenter)
        return cell
    }
}
