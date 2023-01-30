//
//  AddView.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var exerciseStore: ExerciseStore
    @State private var text: String = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    isShowing.toggle()
                } label: {
                    Text("취소")
                }
                Spacer()
                Button {
                    let example = Exercise(content: text)
                    exerciseStore.addExercise(exercise: example, text: text)
                    isShowing.toggle()
                } label: {
                    Text("데이터 추가")
                }
            }
            Spacer().frame(height: 70)
            TextField(text: $text, axis: .vertical) {
                Text("운동일지를 기록해주세요")
                    
            }
            .padding()
            .lineLimit(5...7)
            .background(Color(red: 220/255, green: 220/255, blue: 220/255))
            Spacer()
        }
        .padding()
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isShowing: .constant(true))
    }
}
