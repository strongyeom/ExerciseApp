//
//  exerciseApp.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

@main
struct exerciseApp: App {
    @StateObject var exerciseStore: ExerciseStore = ExerciseStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(exerciseStore)
        }
    }
}
