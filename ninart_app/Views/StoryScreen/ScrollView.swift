//
//  ScrollView.swift
//  ninart_app
//
//  Created by Luciana Adrião on 15/06/22.
//

import UIKit

class ScrollView: UIScrollView {
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundStyle = .minimal
        pageControl.numberOfPages = 5

        return pageControl
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
