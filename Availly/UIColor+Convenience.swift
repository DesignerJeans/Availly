//
//  UIColor+Convenience.swift
//  Availly
//
//  Created by Jaden Nation on 11/23/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	convenience init(hexString: String) {
		var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
		var rgbValue: UInt32 = 0
		
		if cString.hasPrefix("#") {
			cString = cString.substring(from: cString.index(after: cString.startIndex))
		}
		
		Scanner(string: cString).scanHexInt32(&rgbValue)
		
		self.init(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
	
	public func darkenBy(percent: CGFloat) -> UIColor {
		var hue, saturation, brightness, alpha: CGFloat
		hue = 0.0; saturation = 0.0; brightness = 0.0; alpha = 0.0
		getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		
		if percent > 0 {
			brightness = min(brightness - percent, 1.0)
		}
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
		
	}
	
	public func lightenBy(percent: CGFloat) -> UIColor {
		var hue, saturation, brightness, alpha: CGFloat
		hue = 0.0; saturation = 0.0; brightness = 0.0; alpha = 0.0
		getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		
		if percent > 0 {
			brightness = min(brightness + percent, 1.0)
		}
		
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
	}
}
