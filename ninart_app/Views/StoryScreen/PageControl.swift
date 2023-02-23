//
//  PageControl.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit

class PageControl: UIPageControl {

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        pageControl.numberOfPages = 4
        pageControl.backgroundStyle = .minimal
        pageControl.backgroundColor = .red

        return pageControl
    }()

}
