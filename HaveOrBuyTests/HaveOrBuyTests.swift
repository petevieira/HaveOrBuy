//
//  HaveOrBuyTests.swift
//  HaveOrBuyTests
//
//  Created by Peter Vieira on 11/5/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import UIKit
import XCTest

class HaveOrBuyTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
    
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  // Test to confirm that ListItem constructor return when no name is given
  func testListItemInitializationSuccess() {
    let potentialItem = ListItem(name: "TestItem")
    XCTAssertNotNil(potentialItem)
  }
  
  // Failure case for ListItem constructor
  func testListItemInitializationFailure() {
    let potentialItem = ListItem(name: "")
    XCTAssertNil(potentialItem, "Empty name is invalid")
  }
    
}
