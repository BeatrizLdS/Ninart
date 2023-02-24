//
//  AllBooksViewController.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 17/02/23.
//

import UIKit

class AllBooksViewController: UIViewController {

    let allBooksView = AllBooksView()
    var viewModel: BooksViewModel?

    let sectionsTitles : [String] = [String(localized: "continueReading"),
                                     String(localized: "readToMe"),
                                     String(localized: "reading")]

    override func loadView() {
        super.loadView()
        viewModel = BooksViewModel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = allBooksView
        allBooksView.booksTableView.delegate = self
        allBooksView.booksTableView.dataSource = self
        configureNavBar()
    }

    private func configureNavBar() {
        let normalButton = UIButton(type: .custom)
        normalButton.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        normalButton.setTitle("Ninart", for: .normal)
        let systemFont = UIFont.systemFont(ofSize: 32, weight: .semibold)
        let roundedFont: UIFont
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            roundedFont = UIFont(descriptor: descriptor, size: 32)
        } else {
            roundedFont = systemFont
        }
        normalButton.titleLabel?.font = roundedFont
        normalButton.titleLabel?.textAlignment = .natural
        let leftButton = UIBarButtonItem(customView: normalButton)
        leftButton.accessibilityTraits = .header
        leftButton.accessibilityLabel = "Ninart"
        let width = leftButton.customView?.widthAnchor.constraint(equalToConstant: 100)
        width?.isActive = true
        navigationItem.leftBarButtonItem = leftButton
    }
}

extension AllBooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        let systemFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let roundedFont: UIFont
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            roundedFont = UIFont(descriptor: descriptor, size: 18)
        } else {
            roundedFont = systemFont
        }
        header.textLabel?.font = roundedFont
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.textColor = .white
        header.textLabel?.frame = header.frame
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension AllBooksViewController: UITableViewDataSource {

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
        let cell = allBooksView.booksTableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath
        )
        return cell
    }
}
