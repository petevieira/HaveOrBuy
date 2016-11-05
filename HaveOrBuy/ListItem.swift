//
//  ListItem.swift
//  HaveOrBuy
//
//  Created by Peter Vieira on 11/5/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import UIKit

class ListItem {
   // MARK: Properties
  
  var name: String
  
  init?(name: String) {
    self.name = name
    
    // Initialization should fail if name is emtpy
    if name.isEmpty {
      return nil
    }
  }
}
