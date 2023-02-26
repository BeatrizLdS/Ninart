//
//  AudiobookViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import UIKit
import AVFAudio

class AudiobookViewController: UIViewController {
    let audiobookView = AudiobookView()
    let viewModel: AudioBookViewModel = AudioBookViewModel()

    var audioName = "bensound-slider"
    var audioType = "mp3"

    override func viewDidLoad() {
        super.viewDidLoad()
        view = audiobookView
        navigationItem.title = "Exceptional Doom"
//        navigationItem.largeTitleDisplayMode = .never
        self.viewModel.player.delegate = self
    }
    override func viewDidLayoutSubviews() {
        setupUI()
        setupAudio()
    }

    func setupUI() {
        audiobookView.pausePlayButton.addTarget(self, action: #selector(pausePlayAudio), for: .touchUpInside)
        audiobookView.sliderControl.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        audiobookView.sliderControl.addTarget(self, action: #selector(sliderDrag), for: .touchDragInside)
        audiobookView.playBackwardButton.addTarget(self, action: #selector(audioRewind), for: .touchUpInside)
        audiobookView.playForwardButton.addTarget(self, action: #selector(audioForward), for: .touchUpInside)
//        NotificationCenter.default.addObserver(self,selector: #selector(audioEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: viewModel.player)
    }
    func setupDuration() {
        audiobookView.sliderControl.maximumValue = Float(viewModel.player.duration)
        viewModel.durationInMinutes(audiobookView.durationLabel)
    }
    func setupAudio() {
        viewModel.soundEnabling()
        viewModel.prepareToPlay(audioName: audioName, audioType: audioType)
        viewModel.updateButtonIcon(audiobookView.pausePlayButton)
        setupDuration()
        viewModel.updateSlider(slider: audiobookView.sliderControl, label: audiobookView.currentTimeLabel)
    }
    @objc func pausePlayAudio(_ sender: UIButton) {
        viewModel.playbackStatus()
        viewModel.updateButtonIcon(audiobookView.pausePlayButton)

    }
    @objc func sliderValueChanged(_ sender: UISlider) {
        viewModel.updateSliderValue(sender.value)
    }
    @objc func sliderDrag(_ sender: UISlider) {
        viewModel.seekToTime(Double(sender.value))
    }
    @objc func audioRewind(_ sender: UIButton) {
        viewModel.rewindTime()
    }
    @objc func audioForward(_ sender: UIButton) {
        viewModel.forwardTime()
    }
    @objc func audioEnded(_ notification: Notification) {
        print("Right there")
    }
}

extension AudiobookViewController: AVAudioPlayerDelegate {
    // TODO: WHY NO WORKING ?
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
        NotificationCenter.default.post(name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)

    }
}
