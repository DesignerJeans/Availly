//
//  DJNetworkManager.swift
//  Availly
//
//  Created by Jaden Nation on 12/2/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum DJResourceType: String {
	case user, userlist, event, unknown
	
}

class DJNetworkManager: NSObject {
	static let kBaseURL = "https://excellent-tramp-5073.nanoscaleapi.io"
	
	class func handlePotentialErrors(res: DataResponse<Any>, callback: (DataResponse<Any>)->()) {
		guard res.result.error == nil else {
			tellDebugger(msg: res.result.error!.localizedDescription, withType: .error)
			return
		}
		callback(res)
	}
	
	class func retrieve(type: DJResourceType, withID id: [String], callback: @escaping (JSON)->Void) {
		let reqURL = DJNetworkManager.kBaseURL + "/" + type.rawValue
		Alamofire.request(reqURL).responseJSON { res in
			DJNetworkManager.handlePotentialErrors(res: res) { res in
				callback(JSON(res.result.value))
			}
		}
	}
	
	override init() {
		super.init()
		
	}
	
}
