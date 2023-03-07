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
    var listOfStorys = Array <Any, Any>()
    var cellType: CellType = .started
    var selectBookProtocol: SelectBook?

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
        backgroundColor = .clear
        setupSubviews()
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

    func configure(list: Array<Any, Any>, type: CellType) {
        listOfStorys = list
        cellType = type
    }

    func selecteBook() {
        
    }
}

extension CollectionTableViewCell: SettingViews {
    func setupSubviews() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        accessibilityElements = [self.collectionView]
    }
    func setupConstraints() {}
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch cellType {
            case .started:
                return CGSize(width: 240, height: 160)
            case .normal:
                return CGSize(width: 130, height: 180)
            }
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let haptics = UINotificationFeedbackGenerator()
        haptics.notificationOccurred(.success)
        if let book = listOfStorys.get(index: indexPath.row) as? AudioBook {
            selectBookProtocol?.didSelect(book: book)
        } else if let book = listOfStorys.get(index: indexPath.row) as? Story {
            selectBookProtocol?.didSelect(book: book)
        }
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfStorys.getNumberOfElements()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch cellType {
        case .started:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContinueBookCollectionViewCell.identifier,
                for: indexPath) as! ContinueBookCollectionViewCell
            let story = listOfStorys.get(index: indexPath.row)
            if story is AudioBook {
                if let audioBook = listOfStorys.get(index: indexPath.row) as? AudioBook {
                    cell.configureAudioBook(audioBook: audioBook)
                }
            } else {
                if let story = listOfStorys.get(index: indexPath.row) as? Story {
                    cell.configureBook(book: story)
                }
            }
            return cell
        case .normal:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookCollectionViewCell.identifier,
                for: indexPath) as! BookCollectionViewCell
            cell.configure(story: listOfStorys.get(index: indexPath.row))
            return cell
        }

    }

}
