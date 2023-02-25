//
//  CollectionDataSource.swift
//  ninart_app
//
//  Created by Ayslana Riene on 21/06/22.
//

import UIKit

let story = Bundle.main.decode([Story].self, from: "data.json")!

class CollectionDataSource: NSObject, UICollectionViewDataSource {
    let images : [String] = {
        var images : [String] = []
        for pages in story {
            images.append(pages.image)
        }
        return images
    }()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let imageView: UIImageView = {
           let imageView = UIImageView()
            imageView.image = UIImage(named: images[indexPath.item])
            imageView.contentMode = .scaleToFill
            return imageView
        }()
        cell.addSubview(imageView)
        imageView.frame = cell.bounds
        return cell
    }

}
