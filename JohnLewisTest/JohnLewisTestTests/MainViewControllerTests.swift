//
//  JohnLewisTestTests.swift
//  JohnLewisTestTests
//
//  Created by Kesavasankar Jawaharlal on 18/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest
@testable import JohnLewisTest

class MainViewControllerTests: XCTestBaseClass {
    
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
    
    //MARK: - General Tests
    func test_CanInstantiateViewController() {
        XCTAssertNotNil(viewControllerToTest)
    }
    
    func test_CollectionViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(viewControllerToTest.collectionView)
    }
    
    func testTitleIsSet() {
        XCTAssertTrue(viewControllerToTest.title == NSLocalizedString("landing_page-title", comment: ""))
    }
    
    //MARK: - Tests to see conformance to collection view delegate and datasource methods
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
    
    //MARK: - Tests for collection view
    func test_HasNoItemsForCollectionView() {
        XCTAssertNil(viewControllerToTest.productList)
    }
    
    func test_CollectionView_shouldHaveOneItemIfDatasourceIsInitialisedWithOneElement() {
        //Inits
        let json = convert(from: "{" +
            "\"productId\": \"1212\", " +
            "\"title\": \"Dishwasher\", " +
            "\"image\": \"http://k.com/k.png\", " +
            "\"price\": { " +
            "\"now\": \"200.00\", " +
            "\"currency\": \"GBP\" " +
            "}" +
            "}")!
        
        viewControllerToTest.productList = [Product(from: json)!, Product(from: json)!]
        
        //Subject
        viewControllerToTest.collectionView?.reloadData()
        
        //Tests
        XCTAssertEqual(viewControllerToTest.collectionView!.numberOfItems(inSection: 0), 2)
    }
}
