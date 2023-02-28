//
//  SwiftUI_Firebase_Example1App.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/23.
//

import SwiftUI

@main
struct SwiftUI_Firebase_Example1App: App {
    @StateObject private var coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
