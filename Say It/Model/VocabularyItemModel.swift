//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct VocabularyItem: Codable, Identifiable {
    let id: Int
    let english: String
    let pronunciation: String
    let slovak: String
}
