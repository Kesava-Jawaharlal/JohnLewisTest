//
//  ViewController.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 18/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {

    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("landing_page-title", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

