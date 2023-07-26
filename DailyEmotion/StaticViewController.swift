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
        
        EmotionBackgroundViews.forEach { view in
            design(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadEmotionData()
    }
    
    @IBAction func resetBarButtonDidTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "초기화", message: "감정통계 점수를 모두 지우시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            Emotion.allCases.forEach {
                UserDefaults.standard.removeObject(forKey: $0.key)
            }
            self?.loadEmotionData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    private func design(_ view: UIView) {
        view.layer.cornerRadius = 10
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.7
    }
    
    private func loadEmotionData() {
        let happyScore = UserDefaults.standard.integer(forKey: Emotion.happy.key)
        let goodScore = UserDefaults.standard.integer(forKey: Emotion.good.key)
        let sosoScore = UserDefaults.standard.integer(forKey: Emotion.soso.key)
        let upsetScore = UserDefaults.standard.integer(forKey: Emotion.upset.key)
        let sadScore = UserDefaults.standard.integer(forKey: Emotion.sad.key)
        
        happyScoreLabel.text = "\(happyScore)점"
        goodScoreLabel.text = "\(goodScore)점"
        sosoScoreLabel.text = "\(sosoScore)점"
        upsetScoreLabel.text = "\(upsetScore)점"
        sadScoreLabel.text = "\(sadScore)점"
    }
}
