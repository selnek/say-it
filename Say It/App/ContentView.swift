//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let games: [GameButton] = Bundle.main.decode("games.json")
    let animalsGame: [GameItem] = Bundle.main.decode("animals.json")
    let fruitGame: [GameItem] = Bundle.main.decode("fruit.json")
    let thingsGame: [GameItem] = Bundle.main.decode("things.json")
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Text("Say It")
                            .font(.system(size: 50.0))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 90)
                        
                        Image("owl")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                    }
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 12, x: 4, y: -1)
                    .padding(.vertical, 30)
                        
                    List {
                        NavigationLink(destination: GameView(gameName: games[0].name, pictures: animalsGame)) {
                            GameButtonView(game: games[0])
                        }
                        
                        NavigationLink(destination: GameView(gameName: games[1].name, pictures: fruitGame)) {
                            GameButtonView(game: games[1])
                        }
                        
                        NavigationLink(destination: GameView(gameName: games[2].name, pictures: thingsGame)) {
                            GameButtonView(game: games[2])
                        }
                    } //: LIST
                } //: VSTACK
                .navigationBarHidden(true)
            }//: NAVIGATION
        }
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
