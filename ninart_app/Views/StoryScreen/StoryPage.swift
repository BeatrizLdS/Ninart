//
//  StoryPage.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit

class StoryPage: UIScrollView {
    // MARK: Variables
    let sideScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 4
        pageControl.backgroundStyle = .minimal
        pageControl.backgroundColor = .clear
        return pageControl
    }()
    let textView: UIScrollView = {
        let textView = UIScrollView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.isPagingEnabled = false
        textView.showsVerticalScrollIndicator = true
        return textView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "octopus")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let pageText: UILabel = {
        let pageText = UILabel()
        pageText.backgroundColor = .red
        pageText.font.withSize(10)
        pageText.text = "✨ textinho ✨"
//        pageText.textColor = UIColor.AccentText

        return pageText
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont(name: "GillSans-bold", size: 40)
        label.text = "✨ Here I'll tell you a story about a scary guy 🫣"
        label.textColor = UIColor.white
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "GillSans", size: 30)
        label.text = "🎃💀👻"
        label.textColor = UIColor.white
        return label
    }()
    // MARK: Override
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        frame = bounds
    }
}
