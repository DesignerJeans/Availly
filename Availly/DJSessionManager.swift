//
//  DJSessionManager.swift
//  Availly
//
//  Created by Jaden Nation on 11/25/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation

class DJSessionManager: NSObject {
	static var currentAvaillybility: AvaillyStatus? = .unavaillyble
	
	func handleAVBChanged() {
		print("session manager noticed the change!")
	}
	
	override init() {
		super.init()
		print("birthed static session manager")
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAVBChanged),
			name: DJNotification.AVBChanged.asNotificationName(),
			object: nil)
		
	}
}
