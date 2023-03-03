//
//  CircleTimerView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/03/02.
//

import SwiftUI
import AVFoundation


let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 40))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 200, height: 200)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 10)
            )
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 200, height: 200)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(
                        (completed() ? Color.green : Color.orange)
                    )
            )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}



struct CircleTimerView: View {
    @State var counter: Int = 0
    @State var countTo: Int = 0
    @State private var seconds1: Int = 30
    @State private var seconds2: Int = 40
    @State private var seconds3: Int = 60
    
    var body: some View {
        HStack(spacing: 40){
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
            
            VStack(spacing: 13) {
                VStack(spacing: 15) {
                    
                    Button {
                        countTo = seconds1
                    } label: {
                        Text("30초")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 18))
                    
                    Button {
                        countTo = seconds2
                    } label: {
                        Text("40초")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 18))
                    
                    Button {
                        countTo = seconds3
                    } label: {
                        Text("60초")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 18))
                    
                    Button {
                        countTo = 0
                        counter = 0
                    } label: {
                        Text("중지")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 18))
                }
                .font(.title2)
            }
        }
        .padding()
        .onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView()
    }
}
