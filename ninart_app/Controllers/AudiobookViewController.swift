//
//  AudiobookViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import UIKit
import AVFoundation

class AudiobookViewController: UIViewController {
    let audiobookView = AudiobookView()
    let viewModel: AudioBookViewModel = AudioBookViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = audiobookView
        navigationItem.title = "Exceptional Doom"
        navigationItem.largeTitleDisplayMode = .never

        setupUI()

        viewModel.soundEnabling()
        viewModel.playAudio()
        viewModel.updateButtonIcon(audiobookView.pausePlayButton)
        setupDuration()
        startUpdatingSlider()
    }

    func setupUI() {
        audiobookView.pausePlayButton.addTarget(self, action: #selector(pausePlayAudio), for: .touchUpInside)
        audiobookView.sliderControl.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        audiobookView.sliderControl.addTarget(self, action: #selector(sliderDrag), for: .touchDragInside)
    }

    func setupDuration() {
        audiobookView.sliderControl.maximumValue = Float(viewModel.player.duration)
        viewModel.durationInMinutes(audiobookView.durationLabel)
    }

    func startUpdatingSlider() {
        viewModel.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let currentTime = Float(self.viewModel.player.currentTime)
            self.audiobookView.sliderControl.value = currentTime
            self.viewModel.updateTimeLabel(with: currentTime, duration: Float(self.viewModel.player.duration), in: self.audiobookView.currentTimeLabel)
        }
    }

    @objc func pausePlayAudio(_ sender: UIButton) {
        viewModel.pausePlayAudio()
        viewModel.updateButtonIcon(audiobookView.pausePlayButton)
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        viewModel.updateSliderValue(sender.value)
    }

    @objc func sliderDrag(_ sender: UISlider) {
        viewModel.seekToTime(Double(sender.value))
    }

}
