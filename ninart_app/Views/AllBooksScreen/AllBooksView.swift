//
//  AllBooksView.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 17/02/23.
//

import UIKit

class AllBooksView: UIView {

    let sectionsTitles : [String] = [String(localized: "continueReading"),
                                     String(localized: "readToMe"),
                                     String(localized: "reading")]

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

        booksTableView.delegate = self
        booksTableView.dataSource = self
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

extension AllBooksView: UITableViewDelegate {

}

extension AllBooksView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitles[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = booksTableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                      for: indexPath)
        return cell
    }
}
