//
//  ContentView.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var exerciseStore: ExerciseStore
    var body: some View {
            MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ExerciseStore())
    }
}
