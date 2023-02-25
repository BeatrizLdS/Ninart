//
//  AudioBookViewModel.swift
//  ninart_app
//
//  Created by Luciana Adrião on 24/02/23.
//

import Foundation
import UIKit
import AVFoundation

class AudioBookViewModel {
    var audioName = "bensound-lofinerdbassbuzzer"
    var audioType = "mp3"
    var player =  AVAudioPlayer()
    var isPlaying = false
    var timer: Timer?

    func playAudio() {
        guard let audioURL = Bundle.main.url(forResource: audioName, withExtension: audioType) else { return }
        do {
            try player = AVAudioPlayer(contentsOf: audioURL)
            player.play()
            isPlaying = true
        } catch {
            print(error.localizedDescription)
        }
        player.play()
    }

    func pausePlayAudio() {
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }

    func stopAudio(sender: AnyObject) {
        player.stop()
        isPlaying = false
    }

    func updateSliderValue(_ value: Float) {
        player.currentTime = TimeInterval(value)
    }

    func seekToTime(_ time: Double) {
        player.currentTime = time
    }

    func soundEnabling() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            // Mostrar erro pro usuário que o celular pode estar no silencioso
            print("Checar se o celular está no silencioso")
        }
    }

    func updateButtonIcon(_ button: UIButton) {
        let icon = isPlaying ? "pause.circle.fill"  : "play.circle.fill"
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 80)
        button.configuration?.image = UIImage(systemName: icon, withConfiguration: sizeConfig)
    }

    func durationInMinutes(_ label: UILabel) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        if let formattedString = formatter.string(from: TimeInterval(player.duration)) {
            label.text = formattedString
        }
    }

    func currentTimeMinutes(_ label: UILabel) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        if let formattedString = formatter.string(from: TimeInterval(player.currentTime)) {
            label.text = formattedString
        }
    }
    func updateTimeLabel(with currentTime: Float, duration: Float, in label: UILabel) {
        let currentMinutes = Int(currentTime / 60)
        let currentSeconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
        let durationMinutes = Int(duration / 60)
        let durationSeconds = Int(duration.truncatingRemainder(dividingBy: 60))

        let timeText = String(format: "%02d:%02d/ %02d:%02d", currentMinutes, currentSeconds, durationMinutes, durationSeconds)
        label.text = timeText
    }
}
