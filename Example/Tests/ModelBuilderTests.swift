//
//  ModelBuilderTests.swift
//  WistiaKit
//
//  Created by Daniel Spinosa on 5/26/16.
//  Copyright © 2016 Wistia, Inc. All rights reserved.
//

import XCTest
@testable import WistiaKit

class ModelBuilderTests: XCTestCase {

    let wAPI = WistiaAPI(apiToken:"1511ac67c0213610d9370ef12349c6ac828a18f6405154207b44f3a7e3a29e93")

    //MARK: - Project

    func testProjectBuildsMediasWhenIncluded() {
        let expectation = self.expectation(description: "created project with media")

        wAPI.showProject(forHash: "8q6efplb9n") { (project) in
            if let medias = project?.medias , medias.count > 0 {
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    //MARK: - Media

    func testDateFormat() {
        let expectation = self.expectation(description: "media has non-nil dates")

        wAPI.showMedia(forHash: "aza8hcsnd8") { (media) in
            if media?.created != nil && media?.updated != nil {
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    //MARK: - Captions

    func testValidCaptions() {
        let expectation = self.expectation(description: "captions are parsed")

        WistiaAPI.captions(for: "8tjg8ftj2p") { (captions) in
            if captions.count > 0 && captions[0].captionSegments.count > 0 {
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }
}
