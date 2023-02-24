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
    lazy var slider = audiobookView.sliderControl
    var player =  AVAudioPlayer()

//    var player =  AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "", withExtension: ""))
    var audioName = "bensound-slider"
    var audioType = "mp3"

    override func viewDidLoad() {
        super.viewDidLoad()
        view = audiobookView
        navigationItem.title = "Exceptional Doom"
        navigationItem.largeTitleDisplayMode = .never
        soundEnabling()

        slider.addTarget(self, action: #selector(sliderDrag), for: .allTouchEvents)
        audiobookView.pausePlayButton.addTarget(self, action: #selector(pausePlayAudio), for: .touchUpInside)
    }

    @objc func sliderDrag(_ sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
        player.play()

    }

    @objc func pausePlayAudio() {
        if (player.isPlaying) == true {
            player.pause()
            viewModel.updateButton(button: audiobookView.pausePlayButton, playing: player.isPlaying)

        } else if (player.currentTime != 0) {
            player.play()
            viewModel.updateButton(button: audiobookView.pausePlayButton, playing: player.isPlaying)
        } else {
            playAudio(sender: audiobookView.pausePlayButton)
            viewModel.updateButton(button: audiobookView.pausePlayButton, playing: player.isPlaying)
        }
    }

    func playAudio(sender: AnyObject) {
        guard let audioURL = Bundle.main.url(forResource: audioName, withExtension: audioType) else { return }
        do {
            try player = AVAudioPlayer(contentsOf: audioURL)
            slider.maximumValue = Float(TimeInterval(player.duration))
        } catch {
            print(error.localizedDescription)
        }
        player.play()
    }

    func stopAudio(sender: AnyObject) {
        player.stop()

    }

    func soundEnabling() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            // Mostrar erro pro usuário que o celular pode estar no silencioso
            print("Checar se o celular está no silencioso")
        }
    }
}
