//
//  Utils.swift
//  HaveOrBuy
//
//  Created by Peter Vieira on 1/26/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import Foundation

func dispatch_after(_ delay: TimeInterval, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
