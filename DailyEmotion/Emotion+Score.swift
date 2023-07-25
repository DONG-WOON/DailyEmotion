//
//  Emotion+Score.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

enum Emotion: Int {
    case happy
    case good
    case soso
    case upset
    case sad
    
    var tag: Int {
        return self.rawValue
    }
}

enum Score: Int {
    case high = 10
    case middle = 5
    case low = 1
}

// global로 임시 구현
var emotions: [Emotion: Int] = [
    .happy: 0,
    .good: 0,
    .soso: 0,
    .upset: 0,
    .sad: 0,
]
