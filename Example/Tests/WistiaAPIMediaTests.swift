//
//  WistiaAPIMediaTests.swift
//  WistiaKit
//
//  Created by Daniel Spinosa on 5/19/16.
//  Copyright © 2016 Wistia, Inc. All rights reserved.
//

import XCTest
import WistiaKit

class WistiaAPIMediaTests: XCTestCase {
    
    let wAPI = WistiaAPI(apiToken:"1511ac67c0213610d9370ef12349c6ac828a18f6405154207b44f3a7e3a29e93")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //MARK: - WistiaAccount

    //MARK: Show
    func testShowAccount() {
        let expectation = expectationWithDescription("show account")

        wAPI.showAccount { (account) in
            if let a = account {
                if a.accountID == 445830 &&
                    a.name == "WistiaKitAutomatedTests" &&
                    a.accountURLString == "http://wistiakitautomatedtests.wistia.com" &&
                    a.accountURL == NSURL(string:"http://wistiakitautomatedtests.wistia.com") {
                    expectation.fulfill()
                }
            }
        }

        waitForExpectationsWithTimeout(3, handler: nil)
    }



    //MARK: - WistiaMedia

    //MARK: List

    func testListMediasByProject() {
        let expectation = expectationWithDescription("listed medias by project")

        wAPI.listMediasGroupedByProject { (projects) in
            if projects.count > 0 {
                if let media = projects.first?.medias {
                    //TODO: CHECK MEDIA DETAILS
                    expectation.fulfill()
                }
            }
        }

        waitForExpectationsWithTimeout(3, handler: nil)
    }

    //MARK: Show

    //MARK: Create

    //MARK: Update

    //MARK: Delete

    //MARK: Copy

    //MARK: Stats

    //MARK: - WistiaAsset
    //TODO: Dig in
    
    //MARK: - WistiaEmbedOptions
    //TODO: Dig in
    
    
    
    
}
