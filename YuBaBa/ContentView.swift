//
//  ContentView.swift
//  YuBaBa
//
//  Created by 藤井陽介 on 2020/11/08.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var name: String = ""
    let talker = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Spacer()
            Text("契約書")
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            TextField("名前を書きな", text: $name)
                .padding(.all)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .background(Color.gray.opacity(0.1))
            Spacer()
            Button("契約", action: {
                let shortName = String(name.randomElement() ?? "千")
                let utterance = AVSpeechUtterance(string: "フン。\(name)というのかい。贅沢な名だねぇ。今からお前の名前は\(shortName)だ。いいかい、\(shortName)だよ。分かったら返事をするんだ、\(shortName)！")
                utterance.voice =  AVSpeechSynthesisVoice(language: "ja-JP")
                talker.speak(utterance)
            })
                .padding(.all)
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                .cornerRadius(50)
                .font(.system(.title, design: .serif))

            Spacer()
        }
        .padding(.horizontal, 20.0)
        .onAppear {
            let utterance = AVSpeechUtterance(string: "契約書だよ。そこに名前を書きな！")
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            talker.speak(utterance)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
