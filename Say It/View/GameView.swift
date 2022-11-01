//
//  Say_ItApp.swift
//  Say It
//
//  Created by Julius Selnekovic @ 2020.
//

import SwiftUI

struct GameView: View {
    // MARK: - PROPERTIES
    let gameName: String
    let pictures: [GameItem]
    
    let speechManager = SpeechManager()
    let numQuestionsInOneRound: Int = 5
    var alertMessage: String {
        if finalText.isEmpty {
            return "Sorry, I didn't heard anything. Did you say something?"
        } else {
            if scoreTitle == "Correct" {
                return "Great, it was the right answer. Keep going."
            } else {
                return "I heard '\(finalText)'. Next time it will be better. If not, watch our vocabulary :)"
            }
        }
    }
    
    @State private var rndNum: Int =  Int.random(in: 0...3)
    @State private var showingScore: Bool = false
    @State private var counter: Int = 0
    @State private var correctAnswerCounter: Int = 0
    @State private var scoreTitle: String = ""
    @State private var finalText: String = ""
    @State private var recording: Bool = false
    @State private var showingModal: Bool = false
    

    
    // MARK: - FUNCTIONS
    func askQuestion() {
        finalText = ""
        rndNum = Int.random(in: 0...9)
    }
    
    func answeredQuestion(_ answer: String) {
        if pictures[rndNum].name == answer {
            scoreTitle = "Correct"
            correctAnswerCounter += 1
        } else {
            scoreTitle = "Wrong"
        }

        counter += 1
        showingScore = true
    }
    
    func endGame() {
        if counter >= numQuestionsInOneRound {
            showingModal = true
        }
    }
    
    func recordButton() -> some View {
            Button(action: addItem ) {
                    Image(systemName: recording ? "stop.fill" : "mic.fill")
                        .font(.system(size: 35))
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.red)
            }
    }
    
    func addItem() {
        if speechManager.isRecording {
            self.recording = false
            speechManager.stopRecording()
        } else {
            self.recording = true
            speechManager.start { (speechText) in
                guard let text = speechText, !text.isEmpty else {
                    self.recording = false
                    return
                }
                
                DispatchQueue.main.async {
                    finalText = text
                }
            }
        }
        speechManager.isRecording.toggle()
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(gameName.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 8)
                    
                    Text("What is in the picture?")
                }
                .padding(.vertical, 30)
                
                Image(pictures[rndNum].name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding()
                
                HStack {
                    recordButton()
                    
                    Button(action: {
                        answeredQuestion(finalText.lowercased())
                    }) {
                        Text("S u b m i t".uppercased())
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundColor(.green)
                            .frame(minWidth: 120)
                            .background(
                              Capsule()
                                .strokeBorder(lineWidth: 1.10)
                                .foregroundColor(.green)
                            )
                    }
                } //: HSTACK
                .padding(.vertical, 30)
                
                Spacer()
                
            } //: VSTACK
            .onAppear {
                speechManager.checkPermissions()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                    self.endGame()
                    })
        } //: ALERT
            
            // MARK: - ENDGAME
            if showingModal {
                ZStack {
                  Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
                  
                  // MODAL
                  VStack(spacing: 0) {
                    // TITLE
                    Text("GAME OVER")
                      .font(.system(.title, design: .rounded))
                      .fontWeight(.heavy)
                      .padding()
                      .foregroundColor(Color.yellow)
                    
                    // MESSAGE
                    VStack(alignment: .center, spacing: 16) {
                      Image("owl")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 150)
                      
                        Text("You have \(correctAnswerCounter) correct answers from \(numQuestionsInOneRound). \nLet's play again!")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .layoutPriority(1)
                      
                      Button(action: {
                        showingModal = false
                        counter = 0

                      }) {
                        Text("New Game".uppercased())
                          .font(.title2)
                          .fontWeight(.semibold)
                          .padding(.horizontal, 12)
                          .padding(.vertical, 8)
                          .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                          .frame(minWidth: 128)
                          .background(
                            Capsule()
                              .strokeBorder(lineWidth: 1.75)
                              .foregroundColor(.blue)
                          )
                      }
                      .padding()
                    }
                    
                    Spacer()
                  }
                  .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 340, idealHeight: 360, maxHeight: 380, alignment: .center)
                  .background(Color.white)
                  .cornerRadius(20)
                  .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
                } //: ZSTACK
            } //: ENDIF
        } //: ZSTACK
    }
}

// MARK: PREVIEW
struct GameView_Previews: PreviewProvider {
    static var pictures: [GameItem] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GameView(gameName: "Game Name", pictures: pictures)
            
            
    }
}
