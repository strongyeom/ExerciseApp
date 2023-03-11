//
//  Data.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/03/11.
//

import Foundation

struct Data {
    var title: String
}

class DataModel: ObservableObject {
    @Published var data = Data(title: "")
}
