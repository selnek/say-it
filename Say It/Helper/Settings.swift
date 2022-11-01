//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import Foundation

class Settings: ObservableObject {
    @Published var translate: Bool = false
    
    @Published var enableSynthetizer: Bool = false
}
