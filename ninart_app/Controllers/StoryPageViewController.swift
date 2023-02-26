//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit
import CoreData

class StoryViewController: UIViewController, UIScrollViewDelegate {
    let gradientView = GradientView()
    let scrollView = StoryPage().sideScroll
    let pageControl = StoryPage().pageControl
    let story = Bundle.main.decode([Story].self, from: "data.json")!
    var storyIndex : Int = 0
    var hPagesQuantity:Int {
        return story[storyIndex].pages.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        addGradientConstraints()
        configureScrollView()
        createPageDisplay()
        setPageControl()

        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = Float(scrollView.contentOffset.x)/Float(scrollView.frame.size.width)
        pageControl.currentPage = Int(floorf(value))
    }
    // MARK: - SettingHScroll
    private func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])

        let horizontalScroll = CGFloat(hPagesQuantity) * view.frame.size.width
        scrollView.contentSize = CGSize(width: horizontalScroll, height: scrollView.frame.size.height)

    }
    // MARK: - CreateHorizontalPages
    private func createPageDisplay() {
        for element in 0..<hPagesQuantity {
            let page = UIView()
            let textView = StoryPage().textView
            let imageDisplay = UIImage(named: story[storyIndex].pages[element].image)
            let imageView = UIImageView(image: imageDisplay)
            let titleLabel = StoryPage().titleLabel
            let subtitleLabel = StoryPage().subtitleLabel

            imageView.translatesAutoresizingMaskIntoConstraints = false

            scrollView.addSubview(page)
            page.addSubview(imageView)
            page.addSubview(textView)
            page.addSubview(titleLabel)
            textView.addSubview(subtitleLabel)

            page.frame = CGRect(
                x: CGFloat(element) * view.frame.size.width,
                y: 0,
                width: view.frame.size.width,
                height: view.frame.size.height
            )
            imageView.frame = CGRect(
                x: 25,
                y: 70,
                width: view.frame.width-50,
                height: view.center.y/2
            )
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 3/4),
                imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
                imageView.centerXAnchor.constraint(equalTo: page.centerXAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
                titleLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
                textView.centerXAnchor.constraint(equalTo: page.centerXAnchor),
                textView.widthAnchor.constraint(equalTo: page.widthAnchor, constant: -50),
                textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
                textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                subtitleLabel.topAnchor.constraint(equalTo: textView.topAnchor),
                subtitleLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor),
                subtitleLabel.widthAnchor.constraint(equalTo: textView.widthAnchor),
                subtitleLabel.centerXAnchor.constraint(equalTo: textView.centerXAnchor)
            ])
            titleLabel.text = "\(story[storyIndex].title)"
            subtitleLabel.text = "\(story[storyIndex].pages[element].text)"
        }
    }

    // TODO: Pesquisar sobre Size Class com ViewCode com ScrollView
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
    // MARK: - PageControl
    private func setPageControl() {
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            pageControl.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        pageControl.numberOfPages = hPagesQuantity
    }
    // MARK: Selector(PageControl)
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current)*view.frame.size.width , y: 0), animated: true)
    }
}
