//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    var settings = Settings()
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            VocabularyView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Vocabulary")
                }
            
            InfoView()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
            
        }//: TABVIEW
        .environmentObject(settings)
    }
}


// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
