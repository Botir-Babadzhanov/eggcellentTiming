import AVFoundation
import UIKit
import Foundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        var totalTime = eggTimes[hardness]!
        var timer: Timer?

        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                if self.secondsPassed <= totalTime {
                    
                    self.progressBar.progress = Float(self.secondsPassed) / Float(totalTime)
                    print(self.progressBar.progress)
                    
                    self.secondsPassed += 1
                } else {
                    timer.invalidate()
                    self.titleLabel.text = "Countdown Finished!"
                    
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                }
            }
        }
        
        startTimer()

    }
    
    
    
}


