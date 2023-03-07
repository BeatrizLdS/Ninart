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
        normalButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        normalButton.contentHorizontalAlignment = .leading
        normalButton.setTitle("Ninart", for: .normal)
        normalButton.setTitleColor(.text, for: .normal)
        normalButton.titleLabel?.font = UIFontMetrics(
            forTextStyle: .body).scaledFont(
                for: .systemFont(
                    ofSize: 32,
                    weight: .semibold
                )
            )
        normalButton.titleLabel?.textAlignment = .natural
        normalButton.titleLabel?.adjustsFontForContentSizeCategory = true
        let leftButton = UIBarButtonItem(customView: normalButton)
        leftButton.accessibilityTraits = .header
        leftButton.accessibilityLabel = "Ninart"
        let width = leftButton.customView?.widthAnchor.constraint(equalToConstant: 200)
        width?.isActive = true
        navigationItem.leftBarButtonItem = leftButton
    }
}

extension AllBooksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.font = .preferredFont(forTextStyle: .headline)
        header.textLabel?.textColor = .text
        header.textLabel?.frame = header.frame
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let numberOfSections = viewModel?.getNumberOfCategories()
        if (indexPath.section == 0 && numberOfSections == 3) {
            return 160
        } else {
            return 180
        }
    }
}

extension AllBooksViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return (viewModel?.getNumberOfCategories())!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let numberOfSections = viewModel?.getNumberOfCategories()
        return sectionsTitles[(3 - numberOfSections!) + section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allBooksView.booksTableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath
        ) as! CollectionTableViewCell
        cell.selectBookProtocol = self
        let numberOfSections = viewModel?.getNumberOfCategories()
        var sectionType: CellType = .normal
        if numberOfSections == 3 && indexPath.section == 0 {
            sectionType = .started
        }
        cell.configure(list: (viewModel?.getCurrentList(section: indexPath.section))!,
                       type: sectionType)
        return cell
    }
}

extension AllBooksViewController: SelectBook {
    func didSelect<Book>(book: Book) {
        var newViewModel: BookDescriptionViewModel?
        if let audioBook = book as? AudioBook {
            let story = viewModel?.searchStoryForTitle(title: audioBook.title)
            newViewModel = BookDescriptionViewModel(story: story, audioBook: audioBook)
        } else if let story = book as? Story {
            let audioBook = viewModel?.searchAudioBookForTitle(title: story.title)
            newViewModel = BookDescriptionViewModel(story: story, audioBook: audioBook)
        }
        let newViewController = BookDescriptionViewController()
        newViewController.viewModel = newViewModel
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
