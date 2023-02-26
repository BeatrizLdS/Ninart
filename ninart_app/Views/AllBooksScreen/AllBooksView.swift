//
//  AllBooksView.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 17/02/23.
//

import UIKit

enum CellType: Int {
    case started = 0
    case normal = 1
}

class AllBooksView: UIView {

    var navigationController: UINavigationController?

    let booksTableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.register(CollectionTableViewCell.self,
                           forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(booksTableView)
        backgroundColor = .systemPink
    }

    func configureNavigation(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        booksTableView.frame = self.bounds
    }
}
