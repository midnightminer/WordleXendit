//
//  Wordle.swift
//  WordleXendit
//
//  Created by Faizal on 18/03/22.
//

import SwiftUI

struct Wordle: View {
    
    @ObservedObject var viewModel: WordleViewModel = WordleViewModel()
    
    var body: some View {
        VStack {
            ForEach(0..<6) { idx in
                boxHorizontal(idx: idx)
            }
            
            onScreenKeyBoard
        }
    }
    
    
    private func boxHorizontal(idx: Int) -> some View {
        HStack {
            ForEach(0..<5) { cellIndex in
                let letter = viewModel.guessedWords[idx][cellIndex]
                let cellStatus = viewModel.guessedWordsStatus[idx][cellIndex]
                if cellStatus == .edit {
                    defaultBoxCell(letter)
                } else {
                    
                }
            }
        }
    }
    
    @ViewBuilder
    private func defaultBoxCell(_ letter: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(Color .black)
                .frame(width: 50, height: 50, alignment: .center)
                
            Text(letter)
                .font(.system(size: 36))
                .foregroundColor(.black)
                .bold()
        }
    }
    
    @ViewBuilder
    private func submittedBoxCell(letter: String, idx: Int, cellIndex: Int) -> some View {
        ZStack {
            let boxColor = WordleColor.getBoxColor(viewModel.guessedWordsStatus[idx][cellIndex])
            VStack {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(boxColor)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text(letter)
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    @ViewBuilder
        private func singleKeyBoardKey(letter: String,index: Int) -> some View {
            Button {
                viewModel.letterSelected(letter)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(viewModel.keyboardColors[index].backgroundColorOfKeyboard)
                        .frame(width: 27.5, height: 50, alignment: .center)
                    Text("\(letter)")
                        .foregroundColor(viewModel.keyboardColors[index].foregroundColorOfKeyboard)
                }
            }
        }
    
    var onScreenKeyBoard: some View {
        VStack {
            ForEach(0..<3){ row in
                switch row {
                case 0:
                    HStack{
                        ForEach(0..<10){ index in
                            singleKeyBoardKey(letter: LetterModel.allLetters[index], index: index)
                        }
                    }
                case 1:
                    HStack{
                        ForEach(10..<19){ index in
                            singleKeyBoardKey(letter: LetterModel.allLetters[index], index: index)
                        }
                    }
                default:
                    HStack{
                        ForEach(0..<10){ index in
                            singleKeyBoardKey(letter: LetterModel.allLetters[index], index: index)
                        }
                    }
                }
            }
        }
    }
}

struct Wordle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Wordle()
            Wordle()
        }
    }
}
