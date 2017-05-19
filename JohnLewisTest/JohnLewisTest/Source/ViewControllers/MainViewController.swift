//
//  ViewController.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 18/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {

    //MARK: - Vars
    var productList: [Product]?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("landing_page-title", comment: "")
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - Collection View Delegate and Data source methods
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageProductCell.reuseIdentifierString, for: indexPath) as! MainPageProductCell
        let product = productList![indexPath.item]
        
        cell.data = product
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK: utility Methods
extension MainViewController {
    fileprivate func loadData() {
        Network.makeGetCall(with: URL(string: "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20")!) { (result, error) in
            
            guard let result = result, error == nil else {
                return
            }
            
            self.productList = JSONParser.parse(jsonString: result)
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
}
