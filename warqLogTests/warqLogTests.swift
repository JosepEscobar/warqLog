//
//  warqLogTests.swift
//  warqLogTests
//
//  Created by Josep Escobar on 24/10/2019.
//  Copyright © 2019 Josep Escobar. All rights reserved.
//

import XCTest
@testable import warqLog

class warqLogTests: XCTestCase {

    let stringForTest = "Hola Wallapop!"

    override func setUp() {
    }

    override func tearDown() {
    }

    func testInfo() {
        let output: String = WarqLog.info(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

    func testDebug() {
        let output: String = WarqLog.debug(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

    func testVerbose() {
        let output: String = WarqLog.verbose(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

    func testWarning() {
        let output: String = WarqLog.warning(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

    func testError() {
        let output: String = WarqLog.error(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

    func testFatalError() {
        let output: String = WarqLog.fatalError(stringForTest, withTag: "UNIT TEST")
        XCTAssert(output.contains(stringForTest))
    }

}
