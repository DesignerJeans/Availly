//
//  Protocols.swift
//  Availly
//
//  Created by Jaden Nation on 11/29/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation

protocol ReactsToAVBChange {
	func didReceiveNewAVB(sender: Notification)
}
