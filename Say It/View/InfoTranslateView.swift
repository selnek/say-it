//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct InfoTranslateView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var settings: Settings
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                    Text("Info".uppercased())
                        .font(.title)
                    
                    // MARK: - HOW TO PLAY
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Ako hrať", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("""
1. Stlač červený mikrofón. Zapne sa nahrávanie.
2. Vyslov po anglicky meno toho, čo je na obrázku.
3. Stlač červený štvorec. Nahrávanie sa vypne.
4. Skontroluj svoju odpoveď - SUBMIT.
5. Bav sa :)
""")
                                    .font(.footnote)

                        } //: HSTACK
                    } //: GROUPBOX
                    
                    // MARK: - SETTINGS
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Nastavenia", labelImage: "gearshape")) {
                        Divider().padding(.vertical, 4)
                        
                            Toggle(isOn: $settings.translate){
                                Text("Zobrazenie slovenského prekladu")
                                    .font(.footnote)
                            }
                        
                        Toggle(isOn: $settings.enableSynthetizer){
                                Text("Povoľ rečový syntetizátor")
                                    .font(.footnote)
                            }
                            
                    } //: GROUPBOX
                
                    // MARK: - APPLICATION
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Aplikácia", labelImage: "apps.iphone")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("owl")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                                Text("Aplikácia bola vytvorená pre predmet Mobilné technológie v roku 2020. Copyright Július Selnekovič")
                                    .font(.footnote)

                        } //: HSTACK
                    } //: GROUPBOX
                
                Spacer()
                } //: VSTACK
                .padding(.horizontal, 25)
                .padding(.vertical, 30)
                .background(
                    Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
        } //: ZSTACK
    }
}

