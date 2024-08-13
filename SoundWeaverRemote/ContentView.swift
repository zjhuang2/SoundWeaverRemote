//
//  ContentView.swift
//  SoundWeaverRemote
//
//  Created by Jeremy Huang on 7/13/24.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ContentView: View {
    
    @State private var databaseRef: DatabaseReference!
    
    func setupFirebase() {
        databaseRef = Database.database().reference()
    }
    
    @State private var data: [String] = []
    @State private var newItem: String = ""
    
    @State var currentDirection = "NA"
    
    @State var isSensing = false
    
    private func startTranscribing() {
        SpeechRecognizer.shared.startTranscribing()
    }

    private func stopTranscribing() {
        SpeechRecognizer.shared.stopTranscribing()
    }
    
    var body: some View {
        VStack {
            Text("Directional Information").font(.title)
            VStack {
                HStack {
                    DirectionButton(direction: "Front-left",
                                    currentDirection: $currentDirection)
                    Spacer()
                    DirectionButton(direction: "Front",
                                    currentDirection: $currentDirection)
                    Spacer()
                    DirectionButton(direction: "Front-right",
                                    currentDirection: $currentDirection)
                }
                Spacer()
                HStack {
                    DirectionButton(direction: "Left",
                                    currentDirection: $currentDirection)
                    Spacer()
                    DirectionButton(direction: "Right",
                                    currentDirection: $currentDirection)
                }
                Spacer()
                HStack {
                    DirectionButton(direction: "Back-left",
                                    currentDirection: $currentDirection)
                    Spacer()
                    DirectionButton(direction: "Back",
                                    currentDirection: $currentDirection)
                    Spacer()
                    DirectionButton(direction: "Back-right",
                                    currentDirection: $currentDirection)
                }
                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
            }
        }
        Spacer()
        Spacer()
        VStack {
            Spacer()
            Button(action: {
                if !isSensing {
                    startTranscribing()
                    isSensing.toggle()
                } else {
                    stopTranscribing()
                    isSensing.toggle()
                }
            }) {
                Text(isSensing ? "Stop Sensing" : "Start Sensing")
            }
            .frame(width: 200, height: 60)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
            TranscriptView()
        }
        .onAppear {
            AudioSessionManager.shared
        }
    }
}



#Preview {
    ContentView()
}
