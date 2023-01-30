//
//  ExampleCircle.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

struct ExampleCircle: View {
    @State private var duration: Double = 0.0
    @State private var clickedButton: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        
        VStack {
            ProgressView("쉬는시간",value: duration, total:  10)
                .padding()
            Button("타이머 시작") {
                clickedButton.toggle()
            }
            Button("리셋 버튼") {
                duration = 0
                clickedButton.toggle()
            }
            Text(String(format: "%.f", duration))
            }
        .onReceive(timer) { _ in
            if clickedButton {
                if duration < 10 {
                    duration += 1
                    print(duration)
                    
                } else {
                    Timer().invalidate()
                }
                    
            }
        }
        }
}

struct ExampleCircle_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCircle()
    }
}
