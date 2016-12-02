//
//  DJPrimaryVCDataSource.swift
//  Availly
//
//  Created by Jaden Nation on 12/2/16.
//  Copyright © 2016 Jaden Nation. All rights reserved.
//

import Foundation
import UIKit

class DJPrimaryVCDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	var master: DJPrimaryVC?
	var users = [DJUser]()
	var collectionView: UICollectionView? { return master?.friendsCollectionView }
	
	
	// MARK: - UICollectionViewDataSource & Delegate methods
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let out = CGSize(width: 100, height: 100)
		return out
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserHeadshotCell", for: indexPath)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 0
	}
	
	func configureCollectionView(collectionView: UICollectionView) {
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UserHeadshotCell.self, forCellWithReuseIdentifier: "UserHeadshotCell")
	}
	
	override init() {
		
	}
	
	
}
