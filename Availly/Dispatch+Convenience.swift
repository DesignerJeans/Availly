//
//  Dispatch+Convenience.swift
//  Availly
//
//  Created by Jaden Nation on 12/2/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation



func wait(for time: Double, onBGQueue: Bool = false, andThen callback: @escaping (Void)->()) {
	if !onBGQueue {
		DispatchQueue.main.asyncAfter(deadline: .now() + time) {
			callback()
		}
	} else {
		let bgQueue = DispatchQueue(
			label: "bgQueue.com.dJeans",
			qos: .background,
			target: nil)
		bgQueue.asyncAfter(deadline: .now() + time) {
			callback()
		}
	}
}
