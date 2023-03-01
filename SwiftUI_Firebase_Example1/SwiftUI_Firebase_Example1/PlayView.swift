//
//  PlayView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/28.
//

import SwiftUI

struct PlayView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.date, ascending: false)]) private var datas: FetchedResults<Entity>
    
    var data: Entity
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var timerIsPaused: Bool = true
    @State private var timer: Timer?
    
    func startTimer() {
        timerIsPaused = false
        // 1. Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            // 2. Check time to add to H:M:S
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }
    
    func stopTimer() {
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }
    
    func restartTimer(){
      hours = 0
      minutes = 0
      seconds = 0
    }
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            Text(data.title ?? "")
                .font(.title3)
            Text(data.content ?? "")
            
            // 운동시작 타이머: 타이머 누르면 타이머 작동
            HStack {
                Text(String(format: "%02i:%02i:%02i", hours,minutes,seconds))
                    .font(.largeTitle)
                
                if timerIsPaused {
                    HStack {
                        Button {
                            restartTimer()
                            print("Restart")
                        } label: {
                            Image(systemName: "backward.end.alt")
                                .padding()
                        }
                        .padding()
                        
                        Button {
                            startTimer()
                            print("Start")
                        } label: {
                            Image(systemName: "play.fill")
                                .padding()
                        }
                        .padding()
                        
                    }
                } else {
                    Button {
                        stopTimer()
                        print("Stop")
                    } label: {
                        Image(systemName: "stop.fill")
                    }
                    .padding()

                }
  
            }
            // 쉬는 시간 타이머: 시간 설정하고 시작 시간되면 0으로 자동 리셋
            
            // 운동 종료 버튼: 버튼 누르면 dismiss되면서 화면 사라짐
            
        }
        
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(data: Entity())
    }
}
