//
//  StaticViewController.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

import UIKit

class StaticViewController: UIViewController {

    @IBOutlet var EmotionBackgroundViews: [UIView]!
    @IBOutlet weak var happyScoreLabel: UILabel!
    @IBOutlet weak var goodScoreLabel: UILabel!
    @IBOutlet weak var sosoScoreLabel: UILabel!
    @IBOutlet weak var upsetScoreLabel: UILabel!
    @IBOutlet weak var sadScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        EmotionBackgroundViews.forEach { view in
            design(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        happyScoreLabel.text = "\(emotions[.happy]!)점"
        goodScoreLabel.text = "\(emotions[.good]!)점"
        sosoScoreLabel.text = "\(emotions[.soso]!)점"
        upsetScoreLabel.text = "\(emotions[.upset]!)점"
        sadScoreLabel.text = "\(emotions[.sad]!)점"
        
    }
    
    private func design(_ view: UIView) {
        
        view.layer.cornerRadius = 10
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.7
    }
}
