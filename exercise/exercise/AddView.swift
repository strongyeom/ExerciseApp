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
        TextField(text: $text) {
            Text("플레이스 홀더 입니다.")
        }
        Button {
            let example = Exercise(content: text)
            exerciseStore.addExercise(exercise: example, text: text)
            isShowing.toggle()
        } label: {
            Text("데이터 추가")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isShowing: .constant(true))
    }
}
