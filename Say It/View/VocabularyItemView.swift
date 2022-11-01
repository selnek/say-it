//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct VocabularyItemView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var settings: Settings
    
    let vocabularyItem: VocabularyItem
    let speechSynthetizer = SpeechSynthetizer()
    
    // MARK: - BODY
    var body: some View {
        HStack{
            Text(vocabularyItem.english)
                .font(.footnote)
                .frame(width: 100)
            
            Button(action: {
                if settings.enableSynthetizer {
                    speechSynthetizer.speaking(text: vocabularyItem.english)
                }
            }) {
                Text(vocabularyItem.pronunciation)
                    .font(.footnote)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 100)
            }
            
            
            Text(vocabularyItem.slovak)
                .font(.footnote)
                .frame(width: 100)
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct VocabularyItemView_Previews: PreviewProvider {
    static let item: [VocabularyItem] = Bundle.main.decode("vocabulary.json")
    
    static var previews: some View {
        VocabularyItemView(vocabularyItem: item[17])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
