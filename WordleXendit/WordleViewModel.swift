//
//  WordleViewModel.swift
//  WordleXendit
//
//  Created by Faizal on 18/03/22.
//

import Foundation
import SwiftUI

struct LetterStatus {
    var letter: String
    var status: WordleColor
}

struct KeyboardColor {
    let backgroundColorOfKeyboard: Color
    let foregroundColorOfKeyboard: Color
}

struct LetterModel {
    static var allLetters: Array<String> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    static func getIndexOfLetter(_ letter: String) -> Int {
        return allLetters.firstIndex(of: letter)!
    }
}

class WordleViewModel: ObservableObject {
    @Published var guessedWords: Array<Array<String>> = [["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""]]
    @Published var guessedWordsStatus: Array<Array<WordleColor>> = [[.edit,.edit,.edit,.edit,.edit],[.edit,.edit,.edit,.edit,.edit],
                                                                        [.edit,.edit,.edit,.edit,.edit],[.edit,.edit,.edit,.edit,.edit],
                                                                        [.edit,.edit,.edit,.edit,.edit],[.edit,.edit,.edit,.edit,.edit]]
        
    @Published var keyboardColors: Array<KeyboardColor> = Array<KeyboardColor>(repeating: KeyboardColor(backgroundColorOfKeyboard: .black, foregroundColorOfKeyboard: .black), count: LetterModel.allLetters.count)
        
        
        @Published var usedAlphabets: Array<LetterStatus> = []
        
     
        @Published var currentRow = 0
        @Published var currentIndex = 0
        @Published var isSpaceFullInCurrentRow: Bool = false
    
    func letterSelected(_ letter: String) {
            
            if self.isSpaceFullInCurrentRow == true {
                return
            }
            
            self.guessedWords[self.currentRow][self.currentIndex] = letter
            
            if self.currentIndex == 4 {
                self.isSpaceFullInCurrentRow = true
            }
            else {
                self.currentIndex += 1
            }
        }
        
        
}
