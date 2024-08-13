//
//  TranscriptView.swift
//  SoundWeaverRemote
//
//  Created by Jeremy Huang on 8/11/24.
//

import SwiftUI
import Speech

struct TranscriptView: View {
    var transcriptText = SpeechRecognizer.shared.transcriptText
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(transcriptText)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(height: 100)
            }
            
        }
    }
}

//#Preview {
//    TranscriptView()
//}
