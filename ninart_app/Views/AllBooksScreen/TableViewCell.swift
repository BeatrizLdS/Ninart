//
//  TableViewCell.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 20/02/23.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    static let identifier = "CollectionTableViewCell"
    static var continueCells: Bool = true

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 120)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(BookCollectionViewCell.self,
                                forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        collectionView.register(ContinueBookCollectionViewCell.self,
                                forCellWithReuseIdentifier: ContinueBookCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
        accessibilityElements = [self, self.collectionView]
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = self.bounds
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate {

}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        if CollectionTableViewCell.continueCells {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContinueBookCollectionViewCell.identifier,
            for: indexPath) as! ContinueBookCollectionViewCell
        cell.configure(bookTitle: "Águas razas",
                       totalPages: 6,
                       currentPage: 2)
        return cell

        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier,
        //                                                          for: indexPath)
        //        cell.isAccessibilityElement = true
        //        cell.accessibilityLabel = "\(indexPath.row)"
        //        cell.accessibilityTraits = .button
        //        return cell
    }

}
