//
//  StoryPage.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit

class StoryPage: UIScrollView, UIScrollViewDelegate {

    // Mark: - Marcelo

    let titleScreen: UILabel = {
        let title = UILabel()

        title.translatesAutoresizingMaskIntoConstraints = false
        title.frame = CGRect(x: 0, y: 0, width: 69, height: 27)
        title.backgroundColor = .clear
        title.text = "Leitura"
        title.font = UIFont(name: "SFProDisplay-Medium", size: 23.0)
        title.textAlignment = .center
        title.textColor = .black
        title.isAccessibilityElement = true
        title.adjustsFontForContentSizeCategory = true

        return title
    }()

    let upTextBooks: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.frame = CGRect(x: 0, y: 0, width: 339, height: 152)
        text.backgroundColor = .clear

        text.textAlignment = .natural
        text.font = UIFont(name: "SFProText-Regular", size: 16)
        text.textColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
        text.isEditable = false
        text.isAccessibilityElement = true
        text.adjustsFontForContentSizeCategory = true
        if #available(iOS 16.0, *) {
            text.isFindInteractionEnabled = true
        }

        return text
    }()

    let imageStory: UIImageView = {
        let image = UIImageView()

        image.frame = CGRect(x: 0, y: 0, width: 285, height: 141)
        image.bounds = image.frame
        image.image = UIImage(named: "octopus")
        image.backgroundColor = .clear
        image.accessibilityLabel = "imagem do livro"
        image.accessibilityHint = "Toque na imagem"
        image.accessibilityTraits = .image
        image.isAccessibilityElement = true

        return image

    }()

    lazy var downTextBooks = upTextBooks

//    buttonHistory(imgName: <#T##String#>, accesibility: <#T##String#>)
    let leftButtonHistory : UIButton = {

        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "arrow.left.circle.fill"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.backgroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
//        var config = UIButton.Configuration.plain()
//        let size = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium, scale: .medium)
//
//        config.baseForegroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
//        config.image = UIImage(systemName: "plus", withConfiguration: size)
//        button.configuration = config
        button.accessibilityHint = "Toque no butão"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    

    
    
    //MARK: Override
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews(titleScreen, upTextBooks, imageStory, downTextBooks)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        frame = bounds
    }

    func loadJSON(named jsonName: String) {
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let text = try JSONDecoder().decode(String.self, from: data)
                upTextBooks.text = text
            } catch {
                print(error)
            }
        }
    }

    func setAccesibilityLabel(label: String) {
//        buttonHistory.accessibilityLabel = label
    }

    func setImage(image: String) {
//        buttonHistory.setImage(UIImage(named: image), for: .normal)
    }
}
