//
//  DetailedViewController.swift
//  JohnLewisTest
//
//  Created by Kesava on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    //MARK: - Vars
    var product: Product!
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.af_setImage(withURL: product.imageUrl)
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - utility methods
extension DetailedViewController {
    
    func loadData() {
        
        startLoading()
        
        Network.makeGetCall(with: URL(string: "https://api.johnlewis.com/v1/products/\(product.productId)?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb")!) { (result, error) in
            
            self.stopLoading()
            guard let _ = result, error == nil else {
                return
            }
            
        }
    }
}
