//
//  CollectionViewController.swift
//  ninart_app
//
//  Created by Ayslana Riene on 21/06/22.
//

import UIKit

// class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    let collectionDataSource = CollectionDataSource()
//    let flowLayout = ZoomAndSnapFlowLayout()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Test"
//        self.navigationItem.title = "Test"
//
//        guard let collectionView = collectionView else { fatalError() }
//        // collectionView.decelerationRate = .fast // uncomment if necessary
//        collectionView.dataSource = collectionDataSource
//        collectionView.collectionViewLayout = flowLayout
//        collectionView.contentInsetAdjustmentBehavior = .always
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//    }
//
//    init() {
//          super.init(collectionViewLayout: UICollectionViewFlowLayout())
//      }
//      required init?(coder: NSCoder) {
//          fatalError("init(coder:) has not been implemented")
//      }
//
// }
