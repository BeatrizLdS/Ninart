//
//  ViewController.swift
//  ninart_app
//
//  Created by Ayslana Riene on 08/06/22.
//

import UIKit

class MenuViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    internal func setUpTabs() {
        let booksVC = AllBooksViewController()
        let searchVC = AllBooksViewController()
        let favoritesVC = AllBooksViewController()

        booksVC.navigationItem.largeTitleDisplayMode = .automatic
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        favoritesVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: booksVC)
        let nav2 = UINavigationController(rootViewController: searchVC)
        let nav3 = UINavigationController(rootViewController: favoritesVC)

        nav1.tabBarItem = UITabBarItem(
            title: String(localized: "books"),
            image: UIImage(systemName: "books.vertical.fill"),
            tag: 1)
        nav2.tabBarItem = UITabBarItem(
            title: String(localized: "search"),
            image: UIImage(systemName: "magnifyingglass"),
            tag: 2)
        nav3.tabBarItem = UITabBarItem(
            title: String(localized: "favorites"),
            image: UIImage(systemName: "bookmark.fill"),
            tag: 3)

        tabBar.tintColor = .text

        for navs in [nav1, nav2, nav3] {
            navs.navigationBar.prefersLargeTitles = true
        }

        setViewControllers([nav1, nav2, nav3], animated: true)
    }

    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()

        //        let generator = UISelectionFeedbackGenerator()
        //        generator.selectionChanged()
    }
}

// extension MenuViewController : UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath ) {
//        print("selecionou \(indexPath.item)")
//        let storyViewControler = StoryViewController()
//        storyViewControler.storyIndex = indexPath.item
//        navigationController!.pushViewController(storyViewControler, animated: true)
//    }
// }
