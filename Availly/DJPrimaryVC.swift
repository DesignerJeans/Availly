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
	@IBOutlet weak var pullToGoLabel: UILabel!
	
	
	
	// MARK: - properties
	var containerViewBottomConstraint: NSLayoutConstraint?
	var containerViewHeightConstraint: NSLayoutConstraint?
	var collectionViewTopConstraint: NSLayoutConstraint?
	let avbStatusIndicatorHeight: CGFloat = 32
	
	
	// MARK: - custom methods
	func setContainerViewPosition(toReflect availlybility: AvaillyStatus) {
		let navBarHeight = navigationController?.navigationBar.frame.height ?? 44
		let tabBarHeight = tabBarController?.tabBar.frame.height ?? 49
		var color = toggleableContainerView.backgroundColor
		print(navBarHeight)
		print(tabBarHeight)
		
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
			completion: {done in
					DJSessionManager.currentAvaillybility = availlybility
					if let avbStat = DJSessionManager.currentAvaillybility {
						let pushPull = avbStat.rawValue == AvaillyStatus.availlyble.rawValue ?  "pull" : "push"
						let oppositeAVBStat = [AvaillyStatus.availlyble, AvaillyStatus.unavaillyble].filter({$0 != avbStat}).first!.rawValue
						self.pullToGoLabel.text = "\(pushPull) to go \(oppositeAVBStat)"
					}
				
		})
	}
	
	func toggleContainerViewPosition() {
		if let currentAVB = DJSessionManager.currentAvaillybility {
			let avbTypes: [AvaillyStatus] = [.availlyble, .unavaillyble].filter({$0 != currentAVB})
			setContainerViewPosition(toReflect: avbTypes.first!)
		}
	}
	
	
	// MARK: - init methods
	func spawnGestures() {
		
		let dummyToggleTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleContainerViewPosition))
		view.addGestureRecognizer(dummyToggleTapGesture)
	}
	override func viewDidLayoutSubviews() {
		if let navBarHeight = navigationController?.navigationBar.frame.height, let tabBarHeight = tabBarController?.tabBar.frame.height {
			containerViewHeightConstraint?.constant = view.frame.height //- navBarHeight
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
//		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//			self.setContainerViewPosition(toReflect: .availlyble)
//		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.layoutIfNeeded()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addContainerViewConstraints()
		spawnGestures()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

