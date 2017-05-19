//
//  JohnLewisTestTests.swift
//  JohnLewisTestTests
//
//  Created by Kesavasankar Jawaharlal on 18/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest
@testable import JohnLewisTest

class MainViewControllerTests: XCTestCase {
    
    var viewControllerToTest: MainViewController!
    
    override func setUp() {
        super.setUp()
        
        //Initialise the view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
            let viewController = navigationController.topViewController as? MainViewController {
            viewControllerToTest = viewController
            let _ = viewControllerToTest.view // This is called so that viewDidLoad will be called automatically after this, only then all IBOutlets will be available.
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_CanInstantiateViewController() {
        XCTAssertNotNil(viewControllerToTest)
    }
    
    func test_CollectionViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(viewControllerToTest.collectionView)
    }
    
    func test_ShouldSetCollectionViewDataSource() {
        XCTAssertNotNil(viewControllerToTest.collectionView?.dataSource)
    }
    
    func test_ConformsToCollectionViewDataSource() {
        XCTAssert(viewControllerToTest.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(viewControllerToTest.responds(to: #selector(viewControllerToTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(viewControllerToTest.responds(to: #selector(viewControllerToTest.collectionView(_:cellForItemAt:))))
    }
    
    func test_ShouldSetCollectionViewDelegate() {
        XCTAssertNotNil(viewControllerToTest.collectionView?.delegate)
    }
    
    func test_ConformsToCollectionViewDelegate() {
        XCTAssert(viewControllerToTest.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(viewControllerToTest.responds(to: #selector(viewControllerToTest.collectionView(_:didSelectItemAt:))))
    }
    
    //    func test_HasItemsForCollectionView() {
    //        XCTAssertNotNil(viewControllerToTest.items)
    //    }
    

    func testTitleIsSet() {
        XCTAssertTrue(viewControllerToTest.title == NSLocalizedString("landing_page-title", comment: ""))
    }
}
