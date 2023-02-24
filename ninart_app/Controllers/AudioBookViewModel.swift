//
//  AudioBookViewModel.swift
//  ninart_app
//
//  Created by Luciana Adrião on 24/02/23.
//

import Foundation
import UIKit

class AudioBookViewModel {
    func updateButton(button: UIButton, playing: Bool) {
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 80)
        if playing == true {
            button.configuration?.image = UIImage(systemName: "pause.circle.fill",
                                                  withConfiguration: sizeConfig)
        } else {
            button.configuration?.image = UIImage(systemName: "play.circle.fill",
                                                  withConfiguration: sizeConfig)
        }
    }

    func getAudioURL(filename:String, fileType: String) -> URL {
        guard let fileURL = Bundle.main.url(forResource: filename , withExtension: fileType) else {
            return URL(fileURLWithPath: "")
        }
        return fileURL
    }

}
