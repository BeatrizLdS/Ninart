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
    var player =  AVAudioPlayer()
    var isPlaying = false
    var timer: Timer?

    func prepareToPlay(audioName: String, audioType: String) {
        guard let audioURL = Bundle.main.url(forResource: audioName, withExtension: audioType) else { return }
        do {
            try player = AVAudioPlayer(contentsOf: audioURL)
            player.prepareToPlay()
        } catch {
            print(error.localizedDescription)
        }
    }
    func playAudio() {
    player.play()
    isPlaying = true
}
    func playbackStatus() {
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
            // Celular pode estar no silencioso
            print("Checar se o celular está no silencioso")
        }
    }
    func updateButtonIcon(_ button: UIButton) {
        let icon = isPlaying ? "pause.circle.fill"  : "play.circle.fill"
        button.configuration?.image = UIImage(systemName: icon, withConfiguration: UIImage.playButtonSize)
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
        let timeText = String(format: "%02d:%02d", currentMinutes, currentSeconds)
        label.text = timeText
    }
    func rewindTime() {
        let time = 10
        player.currentTime -= Double(time)
    }
    func forwardTime() {
        let time = 10
        player.currentTime += Double(time)
    }

    func playbackEnded() {
        print("VM")
    }
    func updateSlider(slider: UISlider, label: UILabel) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let currentTime = Float(self.player.currentTime)
            slider.value = currentTime
            self.updateTimeLabel(with: currentTime, duration: Float(self.player.duration), in: label)
        }
    }
    func accessibilityCurrentTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        if let formattedString = formatter.string(from: TimeInterval(player.currentTime)) {
            return formattedString
        }
        return ""
    }

    func accessibilityDurationTime() -> String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        if let formattedString = formatter.string(from: TimeInterval(player.duration)) {
            return formattedString
        }
        return ""
    }
}
