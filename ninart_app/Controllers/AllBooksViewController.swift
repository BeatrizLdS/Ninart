//
//  AllBooksViewController.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 17/02/23.
//

import UIKit

class AllBooksViewController: UIViewController {

    let allBooksView = AllBooksView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = allBooksView
        allBooksView.booksTableView.delegate = self
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
        navigationController?.navigationBar.tintColor = .white
    }
}

extension AllBooksViewController: UITableViewDelegate {
    // MARK: usuário scrolla tela a tab bar some
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }

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
        return 200
    }
}
