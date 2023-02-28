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
    var listOfBooks: [Story] = []
    var cellType: CellType = .started

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        layout.collectionView?.contentInsetAdjustmentBehavior = .always
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(list: [Story], type: CellType) {
        listOfBooks = list
        cellType = type
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch cellType {
            case .started:
                return CGSize(width: 240, height: 160)
            case .normal:
                return CGSize(width: 130, height: 180)
            }
//        return UICollectionView.
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfBooks.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch cellType {
        case .started:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContinueBookCollectionViewCell.identifier,
                for: indexPath) as! ContinueBookCollectionViewCell
            cell.configure(
                image: listOfBooks[indexPath.row].image,
                bookTitle: listOfBooks[indexPath.row].title,
                totalPages: 6,
                currentPage: 2)
            return cell
        case .normal:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookCollectionViewCell.identifier,
                for: indexPath) as! BookCollectionViewCell
            cell.configure(story: listOfBooks[indexPath.row])
            return cell
        }

    }

}
