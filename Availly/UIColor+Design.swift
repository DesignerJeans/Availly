//
//  UIColor+Design.swift
//  Availly
//
//  Created by Jaden Nation on 11/24/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import UIKit

enum AvaillyColor: String {
	case blueDark = "#2B2D42"
	case redBright = "#EF233C"
	case graySmoky = "#EDF2F4"
}

extension UIColor {
	class func availlyColor (color: AvaillyColor) -> UIColor {
		return UIColor(hexString: color.rawValue)
	}
}
