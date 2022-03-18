//
//  WordleColor.swift
//  WordleXendit
//
//  Created by Faizal on 18/03/22.
//

import SwiftUI

enum WordleColor {
    case green
    case yellow
    case gray
    case edit
    
    static func getBoxColor(_ status: WordleColor) -> Color {
        switch status {
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        case .gray:
            return Color.gray
        case .edit:
            return Color.black
        }
    }
}
