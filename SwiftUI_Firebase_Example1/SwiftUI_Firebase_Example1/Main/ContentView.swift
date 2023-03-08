//
//  ContentView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("리스트", systemImage: "doc.fill")
                }
            CalendarView()
                .tabItem {
                    Label("달력", systemImage: "calendar")
                }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
