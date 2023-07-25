//
//  MainViewController.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

import UIKit

class MainViewController: UIViewController {
 
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionSideButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapping(Emotion.allCases, with: emotionButtons)
        mapping(Emotion.allCases, with: emotionSideButtons)
        
        addMenu(at: emotionSideButtons)
        addHaptic(at: emotionButtons)
    }
    
    @IBAction func emotionButtonDidTapped(_ sender: UIButton) {

        guard let emotion = Emotion(rawValue: sender.tag) else {
            return
        }
        
        let index = sender.tag
        let emotionSideButton = emotionSideButtons[index]
        switch emotionSideButton.currentTitle {
        case "1점": emotions[emotion]! += 1
        case "5점": emotions[emotion]! += 5
        case "10점": emotions[emotion]! += 10
        default:
            return
        }
    }
    
    fileprivate func mapping(_ emotions: [Emotion], with buttons: [UIButton]) {
        
        for emotion in emotions {
            buttons[emotion.tag].tag = emotion.tag
        }
    }
    
    fileprivate func addMenu(at buttons: [UIButton]) {
        
        buttons.forEach { button in
            button.menu = UIMenu(children: [
                UIAction(title: "1점") { action in
                    button.setTitle(action.title, for: .normal)
                },
                UIAction(title: "5점") { action in
                    button.setTitle(action.title, for: .normal)
                },
                UIAction(title: "10점") { action in
                    button.setTitle(action.title, for: .normal)
                }
            ])
            
            button.changesSelectionAsPrimaryAction = false
            button.showsMenuAsPrimaryAction = true
        }
    }
    
    fileprivate func addHaptic(at buttons: [UIButton]) {
        buttons.forEach { button in
            button.addAction(UIAction { _ in
                Haptics.shared.notify(.success)
            }, for: .touchUpInside)
        }
    }
}

