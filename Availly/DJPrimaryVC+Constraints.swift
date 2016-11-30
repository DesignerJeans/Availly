//
//  DJPrimaryVC+Constraints.swift
//  Availly
//
//  Created by Jaden Nation on 11/25/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import UIKit



extension DJPrimaryVC {
	
	func addContainerViewConstraints() {
		toggleableContainerView.translatesAutoresizingMaskIntoConstraints = false
		
		
		view.addConstraint(NSLayoutConstraint(item: toggleableContainerView,
		                                      attribute: .width,
		                                      relatedBy: .equal,
		                                      toItem: view,
		                                      attribute: .width,
		                                      multiplier: 1,
		                                      constant: 0))
		containerViewHeightConstraint = NSLayoutConstraint(item: toggleableContainerView,
		                                      attribute: .height,
		                                      relatedBy: .equal,
		                                      toItem: nil,
		                                      attribute: .notAnAttribute,
		                                      multiplier: 1,
		                                      constant: 0)
		view.addConstraint(containerViewHeightConstraint!)
		
		view.addConstraint(NSLayoutConstraint(item: toggleableContainerView,
		                                      attribute: .centerX,
		                                      relatedBy: .equal,
		                                      toItem: view,
		                                      attribute: .centerX,
		                                      multiplier: 1,
		                                      constant: 0))
		containerViewBottomConstraint = NSLayoutConstraint(item: toggleableContainerView,
		                                      attribute: .bottom,
		                                      relatedBy: .equal,
		                                      toItem: view,
		                                      attribute: .bottom,
		                                      multiplier: 1,
		                                      constant: 0)
		view.addConstraint(containerViewBottomConstraint!)
		
		
		// collection view
//		AVBFriendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
//		toggleableContainerView.addConstraint(NSLayoutConstraint(
//			item: AVBFriendsCollectionView,
//			attribute: .width,
//			relatedBy: .equal,
//			toItem: toggleableContainerView,
//			attribute: .width,
//			multiplier: 1,
//			constant: 0))
//		toggleableContainerView.addConstraint(NSLayoutConstraint(
//			item: AVBFriendsCollectionView,
//			attribute: .height,
//			relatedBy: .equal,
//			toItem: nil,
//			attribute: .notAnAttribute,
//			multiplier: 1,
//			constant: 60))
//		toggleableContainerView.addConstraint(NSLayoutConstraint(
//			item: AVBFriendsCollectionView,
//			attribute: .centerX,
//			relatedBy: .equal,
//			toItem: toggleableContainerView,
//			attribute: .centerX,
//			multiplier: 1,
//			constant: 0))
//		collectionViewTopConstraint = NSLayoutConstraint(
//			item: AVBFriendsCollectionView,
//			attribute: .top,
//			relatedBy: .equal,
//			toItem: toggleableContainerView,
//			attribute: .top,
//			multiplier: 1,
//			constant: 44)
//		toggleableContainerView.addConstraint(collectionViewTopConstraint!)
//		
	}
	
}
