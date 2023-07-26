//
//  MainViewController.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var sosoButton: UIButton!
    @IBOutlet weak var upsetButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    
    @IBOutlet weak var happySideButton: UIButton!
    @IBOutlet weak var goodSideButton: UIButton!
    @IBOutlet weak var sosoSideButton: UIButton!
    @IBOutlet weak var upsetSideButton: UIButton!
    @IBOutlet weak var sadSideButton: UIButton!
    
    lazy var emotionButtons: [UIButton] = [happyButton, goodButton, sosoButton, upsetButton, sadButton]
    lazy var emotionSideButtons: [UIButton] = [happySideButton, goodSideButton, sosoSideButton, upsetSideButton, sadSideButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapping(Emotion.allCases, with: emotionButtons)
        addTag(at: emotionSideButtons)
        
        addMenu(at: emotionSideButtons)
        addHaptic(at: emotionButtons)
    }

    
    @IBAction func emotionButtonDidTapped(_ sender: UIButton) {
        
        let buttonIndex = sender.tag
        guard let emotion = Emotion(rawValue: buttonIndex) else { return }

        let emotionSideButton = emotionSideButtons[buttonIndex]
        
        guard let scoreToPlus = Score(rawValue: emotionSideButton.tag) else { return }
        
        let beforeScore = UserDefaults.standard.integer(forKey: emotion.key)
        var sumScore = beforeScore
        
        switch scoreToPlus {
        case .low: sumScore += Score.low.point
        case .middle: sumScore += Score.middle.point
        case .high: sumScore += Score.high.point
        }
        
        UserDefaults.standard.set(sumScore, forKey: emotion.key)
    }
    
    fileprivate func mapping(_ emotions: [Emotion], with buttons: [UIButton]) {
        
        for index in 0...emotions.count - 1 {
            buttons[index].tag = emotions[index].tag
        }
    }
    
    fileprivate func addMenu(at buttons: [UIButton]) {
        
        buttons.forEach { button in
            button.menu = UIMenu(children: [
                UIAction(title: Score.low.text) { action in
                    button.setTitle(action.title, for: .normal)
                    button.tag = Score.low.point
                },
                UIAction(title: Score.middle.text) { action in
                    button.setTitle(action.title, for: .normal)
                    button.tag = Score.middle.point
                },
                UIAction(title: Score.high.text) { action in
                    button.setTitle(action.title, for: .normal)
                    button.tag = Score.high.point
                }
            ])
            
            button.changesSelectionAsPrimaryAction = false
            button.showsMenuAsPrimaryAction = true
        }
    }
    
    fileprivate func addTag(at buttons: [UIButton]) {
        buttons.forEach { $0.tag = Score.low.point }
    }
    
    fileprivate func addHaptic(at buttons: [UIButton]) {
        buttons.forEach { button in
            button.addAction(UIAction { _ in
                Haptics.shared.notify(.success)
            }, for: .touchUpInside)
        }
    }
}
