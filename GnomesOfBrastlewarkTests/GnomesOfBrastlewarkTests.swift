//
//  GnomesOfBrastlewarkTests.swift
//  GnomesOfBrastlewarkTests
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import XCTest
@testable import GnomesOfBrastlewark

class GnomesOfBrastlewarkTests: XCTestCase {
    
    var vc: GBHomeViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        let tabVc = storyboard.instantiateInitialViewController() as! UITabBarController
        let nav = tabVc.viewControllers?[0] as! UINavigationController
        vc = nav.viewControllers.first as! GBHomeViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadJSONContent() {
        vc.loadContent()
    }
    
    func testSearchJSONContent() {
        vc.loadContent()
        
        let name = "Zedkin"
        var arrResults:[GBGnome] = [GBGnome]()
        var searchFound: Bool = false
        for i in 0..<GBGnomes.sharedInstance.arrGnomes.count {
            let str: String = GBGnomes.sharedInstance.arrGnomes[i].name
            if str.range(of:name) != nil {
                searchFound = true
                arrResults.append(GBGnomes.sharedInstance.arrGnomes[i])
            }
        }
        
        if searchFound {
            print (String(format:"search found %d matches", arrResults.count))
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
