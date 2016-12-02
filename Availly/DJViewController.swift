//
//  DJViewController.swift
//  Availly
//
//  Created by Jaden Nation on 11/23/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import UIKit

class DJViewController: UIViewController, ReactsToAVBChange {
	
	func didReceiveNewAVB(sender: Notification) {
		// go through list of ReactsToAVBChange objects
//		if let currentAVB = sender.object as? AvaillyStatus {
//			
//		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(didReceiveNewAVB(sender:)),
			name: DJNotification.AVBChanged.asNotificationName(),
			object: nil)
	}

}
