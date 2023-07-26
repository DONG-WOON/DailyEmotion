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
    
    var key: String {
        switch self {
        case .happy:
            return "happy"
        case .good:
            return "good"
        case .soso:
            return "soso"
        case .upset:
            return "upset"
        case .sad:
            return "sad"
        }
    }
    
    var tag: Int {
        return self.rawValue
    }
}
