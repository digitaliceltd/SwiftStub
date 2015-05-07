//
//  PersonTests.swift
//  SwiftStub
//
//  Created by Matt Casey on 07/05/2015.
//  Copyright (c) 2015Digital Ice ltd. All rights reserved.
//

import UIKit
import XCTest

class PersonTests: SSTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFullNameCallsCalculateFullName() {
        let p = MockPerson(firstName: "Matt", lastName: "Casey")
        
        self.stub(method: "calculateFullName()", onObject: p)
        
        let fullName = p.fullName
        
        XCTAssert(p.hasMethodBeenCalled("calculateFullName()"))
    }

}


class MockPerson : Person {
    
    override func calculateFullName() -> String {
        self.markMethodCalled(__FUNCTION__)
        return super.calculateFullName()
    }
    
}