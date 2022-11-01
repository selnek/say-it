//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct VocabularyView: View {
    // MARK: - PROPERTIES
    let vocabulary: [VocabularyItem] = Bundle.main.decode("vocabulary.json")
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Vocabulary".uppercased())
                .font(.title)
            
            List {
                ForEach(vocabulary) { item in
                    VocabularyItemView(vocabularyItem: item)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 0)
                } //: LOOP
            } //: LIST
        } //: VSTACK
        .padding(.vertical, 25)
    }
}

// MARK: - PREVIEW
struct VocabularyView_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyView()
    }
}
