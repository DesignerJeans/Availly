//
//  DJPrimaryVC.swift
//  Availly
//
//  Created by Jaden Nation on 11/23/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import UIKit

class DJPrimaryVC: DJViewController {
	// MARK: - outlets
	@IBOutlet weak var toggleableContainerView: UIView!
	@IBOutlet weak var AVBFriendsCollectionView: UICollectionView!

	// MARK: - properties
	var containerViewBottomConstraint: NSLayoutConstraint?
	var containerViewHeightConstraint: NSLayoutConstraint?
	var collectionViewTopConstraint: NSLayoutConstraint?
	
	
	// MARK: - ReactsToAVBChange methods
	override func handleAVBChanged() {
		print("received notification at correct level")
		super.handleAVBChanged()
	}
//	func didReceiveNewAVB(withType type: AvaillyStatus) {
//		print("main VC noticed the change!")
//		setContainerViewPosition(toReflect: type)
//	}
	
	// MARK: - custom methods
	func setContainerViewPosition(toReflect availlybility: AvaillyStatus) {
		let navBarHeight = navigationController?.navigationBar.frame.height ?? 44
		let tabBarHeight = tabBarController?.tabBar.frame.height ?? 49
		var color = toggleableContainerView.backgroundColor
		
		switch availlybility {
		case .availlyble: // up
			print("availlyble")
			containerViewBottomConstraint?.constant = -(navBarHeight + tabBarHeight)
			collectionViewTopConstraint?.constant = navBarHeight
			color = .availlyColor(color: AvaillyColor.redBright)
		case .unavaillyble: // down
			print("unavaillyble")
			collectionViewTopConstraint?.constant = 0 
			containerViewBottomConstraint?.constant = -tabBarHeight
			color = .availlyColor(color: AvaillyColor.blueDark)
		}
		UIView.animate(
			withDuration: 0.35,
			delay: 0,
			options: .curveEaseInOut,
			animations: {
				self.toggleableContainerView.backgroundColor = color
				self.view.layoutIfNeeded()
				
		},
			completion: nil)
	}
	
	func toggleContainerViewPosition() {
		
		
		
		
//		if let currentAVB = DJSessionManager.currentAvaillybility {
//			let avbTypes: [AvaillyStatus] = [.availlyble, .unavaillyble].filter({$0 != currentAVB})
//			setContainerViewPosition(toReflect: avbTypes.first!)
//		}
	}
	
	
	// MARK: - init methods
	func spawnGestures() {
		view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleContainerViewPosition)))
	}
	
	override func viewDidLayoutSubviews() {
		if let navBarHeight = navigationController?.navigationBar.frame.height, let tabBarHeight = tabBarController?.tabBar.frame.height {
			containerViewHeightConstraint?.constant = view.frame.height - navBarHeight
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			NotificationCenter.default.post(Notification(name: DJNotification.AVBChanged.asNotificationName()))
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.layoutIfNeeded()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		AVBFriendsCollectionView.alpha = 0
		addContainerViewConstraints()
		spawnGestures()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

