//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct InfoView: View {
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
                            SettingsLabelView(labelText: "How To Play", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("""
1. Press the red microphone. Recording starts.
2. Say in English the name of what is in the picture.
3. Press the red square. Recording will stop.
4. Check your answer - SUBMIT.
5. Have fun :)
""")
                                    .font(.footnote)
                            
                        } //: HSTACK
                    } //: GROUPBOX
                    
                    // MARK: - SETTINGS
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Settings", labelImage: "gearshape")) {
                        Divider().padding(.vertical, 4)
                        
                        Toggle(isOn: $settings.translate){
                                Text("Show slovak translation")
                                    .font(.footnote)
                            }

                        Toggle(isOn: $settings.enableSynthetizer){
                                Text("Enable speech synthetizer")
                                    .font(.footnote)
                            }
                            
                    } //: GROUPBOX
                
                    // MARK: - APPLICATION
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("owl")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                                Text("The application was created for the subject Mobile Technologies in 2020. Copyright Július Selnekovič")
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
            
            if settings.translate {
                InfoTranslateView()
            }
        } //: ZSTACK
    }
}

// MARK: - SETTINGS LABEL VIEW
struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
