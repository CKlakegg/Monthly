//
//  MonthlyConfig.swift
//  Monthly
//
//  Created by Caroline Klakegg on 24/10/2023.
//


import Foundation
import SwiftUI


struct MonthlyConfig {
  
    let backgroundColor: Color
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color
    
    static func determineConfig(from date: Date) -> MonthlyConfig {
        
        let monthInt = Calendar.current.component(.month, from: date)
        
        switch monthInt {
            
        case 1:
            return MonthlyConfig(backgroundColor: .clear, emojiText: "🌬️", weekdayTextColor: .black.opacity(0.6), dayTextColor: .mint.opacity(0.5))
        case 2:
            return MonthlyConfig(backgroundColor: .pink, emojiText: "🦞", weekdayTextColor: .blue.opacity(0.2), dayTextColor: .white.opacity(0.4))
        case 3:
            return MonthlyConfig(backgroundColor: .blue, emojiText: "💿", weekdayTextColor: .pink.opacity(0.3), dayTextColor: .white.opacity(0.4))
        case 4:
            return MonthlyConfig(backgroundColor: .indigo, emojiText: "🖇️", weekdayTextColor: .blue.opacity(0.1), dayTextColor: .white.opacity(0.1))
        case 5:
            return MonthlyConfig(backgroundColor: .red, emojiText: "🌈", weekdayTextColor: .yellow.opacity(0.6), dayTextColor: .white.opacity(0.5))
        case 6:
            return MonthlyConfig(backgroundColor: .gray, emojiText: "🧚🏻‍♂️", weekdayTextColor: .white.opacity(0.2), dayTextColor: .green.opacity(0.5))
        case 7:
            return MonthlyConfig(backgroundColor: .cyan, emojiText: "🦔", weekdayTextColor: .black.opacity(0.3), dayTextColor: .blue.opacity(0.5))
        case 8:
            return MonthlyConfig(backgroundColor: .gray, emojiText: "🍿", weekdayTextColor: .yellow.opacity(0.6), dayTextColor: .white.opacity(0.5))
        case 9:
            return MonthlyConfig(backgroundColor: .yellow, emojiText: "🌓", weekdayTextColor: .blue.opacity(0.5), dayTextColor: .orange.opacity(0.5))
        case 10:
            return MonthlyConfig(backgroundColor: .brown, emojiText: "🐽", weekdayTextColor: .cyan.opacity(0.6), dayTextColor: .white.opacity(0.5))
        case 11:
            return MonthlyConfig(backgroundColor: .gray, emojiText: "🌨️", weekdayTextColor: .black.opacity(0.6), dayTextColor: .blue.opacity(0.3))
        case 12:
            return MonthlyConfig(backgroundColor: .green, emojiText: "🚀", weekdayTextColor: .black.opacity(0.6), dayTextColor: .white.opacity(0.3))
      
        default:
      
            return MonthlyConfig(backgroundColor: .gray, emojiText: "default", weekdayTextColor: .black.opacity(0.6), dayTextColor: .green.opacity(0.2))
        }
    }
    
}

