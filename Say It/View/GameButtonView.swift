//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct GameButtonView: View {
    //: MARK - PROPERTIES
    let game: GameButton
    
    //: MARK - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(game.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 5)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                Text(game.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                
                Text(game.text)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.trailing, 8)
                
            } //: VSTACK
        } //: HSTACK
      
    }
}


//: MARK - PREVIEW
struct GameButtonView_Previews: PreviewProvider {
    static let game: [GameButton] = Bundle.main.decode("games.json")
    static var previews: some View {
        GameButtonView(game: game[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
