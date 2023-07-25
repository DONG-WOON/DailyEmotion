//
//  MainViewController.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func happyEmotionTapped(_ sender: UITapGestureRecognizer) {
        emotions[.happy]! += 1
    }
    
    @IBAction func goodEmotionTapped(_ sender: UITapGestureRecognizer) {
        emotions[.good]! += 1
    }
    
    @IBAction func sosoEmotionTapped(_ sender: UITapGestureRecognizer) {
        emotions[.soso]! += 1
    }
    
    @IBAction func upsetEmotionTapped(_ sender: UITapGestureRecognizer) {
        emotions[.upset]! += 1
    }
    
    @IBAction func sadEmotionTapped(_ sender: UITapGestureRecognizer) {
        emotions[.sad]! += 1
    }
    
    
}

