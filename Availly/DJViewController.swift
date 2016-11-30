//
//  DJViewController.swift
//  Availly
//
//  Created by Jaden Nation on 11/23/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import UIKit

class DJViewController: UIViewController {
	
	func handleAVBChanged() {
		print("top level got called?")
		// go through list of ReactsToAVBChange objects
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAVBChanged),
			name: DJNotification.AVBChanged.asNotificationName(),
			object: nil)
	}

}
