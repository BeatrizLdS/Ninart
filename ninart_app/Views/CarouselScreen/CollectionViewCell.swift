//
//  CollectionViewCell.swift
//  ninart_app
//
//  Created by Ayslana Riene on 21/06/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
