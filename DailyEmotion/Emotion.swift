//
//  Emotion.swift
//  DailyEmotion
//
//  Created by 서동운 on 7/25/23.
//

enum Emotion: Int, CaseIterable {
    case happy
    case good
    case soso
    case upset
    case sad
    
    var tag: Int {
        return self.rawValue
    }
}

// global로 임시 구현
var emotions: [Emotion: Int] = [
    .happy: 0,
    .good: 0,
    .soso: 0,
    .upset: 0,
    .sad: 0,
]
