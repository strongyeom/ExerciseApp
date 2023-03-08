//
//  AddView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/28.
//

import SwiftUI


struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var category: String = ""
    @State private var categoryString: String = ""
    @State private var colorIndex: Int = 0
    
    private var categorys = ["하체", "가슴", "등", "어깨", "팔"]
    private var colors: [Color] = [.red, .yellow, .mint, .gray, .green]

    
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        
        

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                TextField("제목", text: $title)
                    .padding()
                    .frame(width: 300, height: 40)
                    .textInputAutocapitalization(.never)
                    .border(.blue)
                
                HStack {
                    ForEach(Array(zip(categorys.indices, categorys)), id:\.0) { index, category in
                        Button {
                            categoryString = category
                            colorIndex = index
                        } label: {
                            
                            
                            Text("\(category)")
                                .fontWeight(.bold)
                                .frame(width: 50, height: 25, alignment: .center)
                                .foregroundColor(categoryString == category ? Color.white : Color.gray)
                                .background(content: {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(categoryString == category ? colors[index] : Color.white)
                                })
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(categoryString == category ? colors[index] : Color.gray)
                                }
                        }
                    }
                }
                
                TextEditor(text: $content)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .border(.blue)
                    .frame(height: 300)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addData()
                        dismiss()
                    } label: {
                        Text("저장하기")
                    }
                    
                }
        }
        }
    }
    
    func addData() {
        withAnimation {
            let data = Entity(context: viewContext) // 객체를 만든다.
            data.title = title
            data.content = content
            data.category = categoryString
            data.colorIndex = Int32(colorIndex)
            data.date = Date.now
            try? viewContext.save() // 저장한다.
        }
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
