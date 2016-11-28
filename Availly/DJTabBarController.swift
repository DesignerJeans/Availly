//
//  DJTabBarController.swift
//  Availly
//
//  Created by Jaden Nation on 11/23/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import UIKit

class DJTabBarController: UITabBarController {
	
	func configureTabs() {
		
		let nibNames = [
			"DJPrimaryVC",
			"DJProfileVC",
			"DJCreateEventVC",
		]
		
		let tabImgs: [UIImage] = [
			UIImage(named: "btnTabPrimary")!,
			UIImage(named: "btnTabProfile")!,
			UIImage(named: "btnTabCreate")!,
		]
		var viewControllers = [UIViewController]()
		for (z, nibName) in nibNames.enumerated() {
			let nibContents = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
			if let vc = nibContents?.first as? DJViewController {
				let navC = DJNavigationController(rootViewController: vc)
				
				navC.tabBarItem.image = tabImgs[z]
				viewControllers.append(navC)
			}
		}
		self.viewControllers = viewControllers
		
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		configureTabs()

    }

}
