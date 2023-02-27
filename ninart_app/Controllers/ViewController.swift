//
//  ViewController.swift
//  ninart_app
//
//  Created by Ayslana Riene on 08/06/22.
//

import UIKit

class ViewController: UIViewController {

    let story = Bundle.main.decode([Story].self, from: "data.json")!

    var hItemsValue:Int {
        return story.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundView = UIView()
        backgroundView.backgroundColor = .opaqueSeparator
        backgroundView.frame = view.bounds

        self.navigationItem.title = "Main Stories ☾"

        view.addSubview(backgroundView)

        for element in 0..<hItemsValue {

            let button = UIButton()

            button.backgroundColor = .link
            let xVal = CGFloat(element)
            button.frame = CGRect(x: view.frame.midX/2,
                                  y: 100+(xVal * view.frame.midY/3),
                                  width: 200, height: 100)
            button.addTarget(self, action: #selector(openGreenView(_:)), for: .touchUpInside)
            button.setTitle("\(story[element].title)", for: .normal)
            button.setTitleColor(UIColor.Primary, for: .normal)
            button.setTitleColor(UIColor.Accent, for: .highlighted)
            button.tag = element
            view.addSubview(button)
        }

    }

    @objc private func openGreenView(_ sender: UIButton) {
        let pageIndex = sender.tag

        let storyPageController = StoryViewController()
        storyPageController.storyIndex = pageIndex
        self.navigationController?.pushViewController(storyPageController, animated: true)

    }
}
