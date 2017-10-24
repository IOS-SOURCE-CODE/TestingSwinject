//
//  SwinjectStoryboard+Extensions.swift
//  TestSwinject
//
//  Created by Hiem Seyha on 10/24/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    public class func setup() {
        
        if AppDelegate.dependencyRegistry == nil {
            
            AppDelegate.dependencyRegistry = DependencyRegistryImpl(container: SwinjectStoryboard.defaultContainer)
        }
        
        let dependencyRegistry: DependencyRegistry = AppDelegate.dependencyRegistry
        
        
        func main() {
            
            print("Helllo SwinjectStoryboard")
            
            dependencyRegistry.container.storyboardInitCompleted(ViewController.self) { (r, vc) in
                let presenter = r.resolve(ProductListPresenter.self)!
                vc.configure(with: presenter, productCellMaker: dependencyRegistry.productCell)
            }
        }
        
        main()
        
    }
}



extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

