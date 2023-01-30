//
//  MainView.swift
//  exercise
//
//  Created by 염성필 on 2023/01/27.
//

import SwiftUI

//let examplearray = ["123", "456", "going", "i can do it"]

struct MainView: View {
    
    @EnvironmentObject var exerciseStore: ExerciseStore
    @State private var isShowing: Bool = false
    @State private var checked: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    
                    ForEach(Array(zip(exerciseStore.exerciseArray.indices, exerciseStore.exerciseArray)), id:\.0) {
                        index, content in
                        NavigationLink {
                            ExerciseDetailView(checked: $checked, exercise: content)
                        } label: {
                            Text(content.content)
                        }
                        .overlay {
                            HStack {
                                Spacer().frame(width: 100)
                                Image(systemName: checked ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                                    .onTapGesture {
                                        checked.toggle()
                                    }
                            }
                            
                        }
                    }
                    .onDelete(perform: delete)
                }
                .sheet(isPresented: $isShowing) {
                    AddView(isShowing: $isShowing)
                        .presentationDetents([.medium])
                }
            }
           
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowing.toggle()
                        
                    } label: {
                        Text("추가하기")
                    }

                }
            }
           
        }
    }
    func delete(at offsets: IndexSet) {
        exerciseStore.exerciseArray.remove(atOffsets: offsets)
    }
}






struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ExerciseStore())
    }
}
