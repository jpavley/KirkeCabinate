//
//  KirkeDrugTests.swift
//  KirkeCabinateTests
//
//  Created by John Pavley on 6/22/18.
//  Copyright © 2018 John Pavley. All rights reserved.
//

import XCTest

class KirkeDrugTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateDrug() {

        let drugUT = Drug(name: "Metformin", units: .mg, strength: 500, form: .tablet)
        XCTAssertNotNil(drugUT, "Drug object was not created")
    }
    
    func testDrugDescription() {
        
        let drugUT = Drug(name: "Metformin", units: .mg, strength: 500, form: .tablet)
        let expectedString = "Metformin 500.0 MG tablet"
        XCTAssertEqual(drugUT.description, expectedString, "Drug description malformed")
    }
}
