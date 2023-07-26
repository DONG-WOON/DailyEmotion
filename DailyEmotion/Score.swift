//
//  Score.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/26/23.
//

import Foundation

enum Score: Int {
    case high = 10
    case middle = 5
    case low = 1
    
    var text: String {
        return "\(self.rawValue)점"
    }
    
    var point: Int {
        return self.rawValue
    }
}
