//
//  ViewController.swift
//  ninart_app
//
//  Created by Ayslana Riene on 08/06/22.
//

import UIKit

class MenuViewController: UIViewController {

    let gradientView = GradientView()
    let menuCollection = CollectionViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Menu ✧"
        addGradientConstraints()
        addCollectionConstraints()
        menuCollection.collectionView.delegate = self
    }
    // MARK: - BackScreenConstraints
    private func addGradientConstraints() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // MARK: - CollectionConstraints
    private func addCollectionConstraints() {
        menuCollection.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuCollection.view)
        menuCollection.collectionView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            menuCollection.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCollection.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuCollection.view.topAnchor.constraint(equalTo: view.topAnchor),
            menuCollection.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MenuViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath ) {
        print("selecionou \(indexPath.item)")
        let storyViewControler = StoryViewController()
        storyViewControler.storyIndex = indexPath.item
        navigationController!.pushViewController(storyViewControler, animated: true)
    }
}
