//
//  PlayView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/28.
//

import SwiftUI

struct PlayView: View {
        
    var data: Entity
    @Environment(\.dismiss) var dismiss
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var timerIsPaused: Bool = true
    @State private var timer: Timer?

    
    // 타이머 사이즈
    let fontSize: CGFloat = 30
    
    /// 시작 타이머
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
    
    /// 중지 타이머
    func stopTimer() {
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }
    /// 리셋 타이머
    func resetTimer(){
      hours = 0
      minutes = 0
      seconds = 0
    }
    
  
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            Text(data.title ?? "")
                .font(.title2)
                .padding(.bottom, 10)
            Text(data.content ?? "")
                .padding()
                .background(Color(red: 211/255, green: 211/255, blue: 211/255))
                .cornerRadius(12)
                .padding(.bottom, 15)
            
            
            
            // 운동시작 타이머: 타이머 누르면 타이머 작동
            HStack(spacing: 20) {
                Text("운동시간")
                    .font(.title3)
                
                Text(String(format: "%02i:%02i:%02i", hours,minutes,seconds))
                    .font(.system(size: fontSize))
                    .frame(width: 120, height: 30)
                    .minimumScaleFactor(0.1)
                
                if timerIsPaused {
                    HStack {
                        Button {
                            resetTimer()
                            print("Reset")
                        } label: {
                           Text("리셋")
                        }
                        
                        .padding(.trailing, 10)
                        
                        Button {
                            startTimer()
                            print("Start")
                        } label: {
                           Text("시작")
                        }
                    }
                    .font(.title3)
                } else {
                    HStack {
                        Button {
                            stopTimer()
                            print("Stop")
                        } label: {
                           Text("중지")
                        }
                       
                        Button {
                            // 레이아웃 맞추기 위해서
                        } label: {
                            Text("빈칸")
                                .foregroundColor(.white)
                        }

                    }
                    .font(.title3)
                }
            }
            
            CircleTimerView()
                .padding(.bottom, 25)
            HStack {
                Spacer()
                // 운동 종료 버튼: 버튼 누르면 dismiss되면서 화면 사라짐
                Button {
                    // 운동종료 되면 달력에 표시됌
                    dismiss()
                    
                } label: {
                    Text("운동종료")
                        .font(.title)
                    
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 18))
                
                Spacer()
            }
           Spacer()
        }
        .padding()
        // 화면이 사라졌을때 타이머 초기화
        .onDisappear {
            stopTimer()
            resetTimer()
            print("playView down&TimerReset")
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(data: Entity())

    }
}
