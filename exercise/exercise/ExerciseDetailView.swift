//
//  ExerciseDetailView.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isToggle: Bool = false
    @Binding var  checked: Bool
    var exercise: Exercise
    var body: some View {
        VStack {
            
            Image(systemName: "flame")
            HStack {
                Text(exercise.content)
                Image(systemName: checked ? "checkmark.square.fill" : "square")
                    .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                    .onTapGesture {
                        checked.toggle()
                    }
            }
          
           
            ExampleCircle()
            
            Button {
                print("종료 버튼이 눌렸습니다.")
                dismiss()
            } label: {
                Text("종료")
            }
            .disabled(checked ? false : true)
            
           
        }
       
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(checked: .constant(true), exercise: Exercise(content: "예시 입니다."))
    }
}
