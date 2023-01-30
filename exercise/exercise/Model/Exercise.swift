//
//  ExampleArray.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

struct Exercise {
    var id = UUID()
    var content: String
    
    
}

class ExerciseStore: ObservableObject {
    @Published var exerciseArray: [Exercise] = []
    
//    init() {
//        let exampleArrays = [ ]
//        exampleArray = exampleArrays
//        print(exampleArray)
//    }
    
    func addExercise(exercise: Exercise, text: String) {
        exerciseArray.append(Exercise(content: text))
        print("addExample: \(exerciseArray)")
    }
}
