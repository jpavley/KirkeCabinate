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
    
    func testLoadFromDataFile() {
        
        let drugsUT = Drug.loadDrugs()
        XCTAssertNotNil(drugsUT, "Drug list was not loaded")
        XCTAssertGreaterThan(drugsUT.count, 3, "Drug data is missing from list")
    }
    
    func testLoadedDrugsHaveData() {

        let drugsUT = Drug.loadDrugs()

        // First 3 rows are test drugs
        let expectedString1 = "Longbottom Leaf 500.0 MG tablet"
        let expectedString2 = "Unicorn Vitamins 10.0 MCG liquid"
        let expectedString3 = "Love Potion 3.0 ML injection"

        XCTAssertEqual(drugsUT[0].description, expectedString1, "Drug description 1 malformed")
        XCTAssertEqual(drugsUT[1].description, expectedString2, "Drug description 2 malformed")
        XCTAssertEqual(drugsUT[2].description, expectedString3, "Drug description 3 malformed")
    }
}
