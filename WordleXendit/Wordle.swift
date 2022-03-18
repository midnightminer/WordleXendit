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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(1, contentMode: .fit)
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
}

struct Wordle_Previews: PreviewProvider {
    static var previews: some View {
        Wordle()
    }
}
