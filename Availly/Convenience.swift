//
//  Convenience.swift
//  Availly
//
//  Created by Jaden Nation on 12/2/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import UIKit

enum DebugMsgType: String {
	case error = "X"
	case alert = "!"
	case success = "√"
	case process = ".."
}

func tellDebugger(msg: String, withType type: DebugMsgType) {
	print("[\(type.rawValue)]  \(msg)")
}
