//
//  Utils.swift
//  have-or-buy
//
//  Created by Peter Vieira on 1/26/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import Foundation

func dispatch_after(delay: NSTimeInterval, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}