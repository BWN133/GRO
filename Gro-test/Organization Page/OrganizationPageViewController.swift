//
//  OrganizationPageViewController.swift
//  Gro-test
//
//  Created by Long Do on 10/18/22.
//  Copyright © 2022 Shu Tong Luo. All rights reserved.
//

import UIKit

class OrganizationPageViewController: UIViewController {

    @IBOutlet weak var organizationImageView: UIImageView!
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        
        // Set up org page collection layout
        upcomingEventsCollectionView.collectionViewLayout = layout
        upcomingEventsCollectionView.delegate = self
        upcomingEventsCollectionView.dataSource = self
        upcomingEventsCollectionView.register(UpcomingEventsCollectionViewCell.nib(), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")

        // Set org logo layout
        organizationImageView.backgroundColor = UIColor.gray
        organizationImageView.layer.masksToBounds = true
        organizationImageView.layer.cornerRadius = organizationImageView.frame.height / 2
    }
}

extension OrganizationPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
        cell.configure(with: UIImage(named: "Image")!)
        return cell
    }
}

extension OrganizationPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension OrganizationPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
