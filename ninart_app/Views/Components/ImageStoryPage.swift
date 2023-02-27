//
//  ImageStorypage.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 24/02/23.
//

import UIKit

class ImageStoryPage: UIView {

    let imageStory: UIImageView = {
        let image = UIImageView()
        
        image.frame = CGRect(x: 0, y: 0, width: 285, height: 141)
        image.bounds = image.frame
        image.backgroundColor = .clear
        image.accessibilityLabel = "imagem do livro"
        image.accessibilityHint = "Toque na imagem"
        image.accessibilityTraits = .image
        image.isAccessibilityElement = true

        return image

    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadImage(named imageName: String) {
        imageStory.image = UIImage(named: imageName)
    }

    func buildLayout(){
        self.addSubview(imageStory)

        NSLayoutConstraint.activate([
            imageStory.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageStory.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            imageStory.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageStory.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
