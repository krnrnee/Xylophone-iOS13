//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let note = (sender.currentTitle ?? "C") + "\(sender.tag)" 
        animateButton(button: sender)
        playSound(sound: note, type: "wav")
    }
    
    func animateButton(button: UIButton) {
        setButtonAlpha(object: button, alphaValue: 0.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {self.setButtonAlpha(object: button, alphaValue: 1.0)})
    }
    
    func setButtonAlpha(object: UIButton, alphaValue: CGFloat) {
        object.alpha = alphaValue
    }
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            }
            catch {
                print("Error Playing Sound")
            }
        }
    }
    

}

