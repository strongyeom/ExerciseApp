//
//  SearchView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/03/14.
//

import SwiftUI



struct SearchView: View {
    
    private var mainCategoies: [Color] = [.red, .yellow, .mint, .gray, .green]
    @Environment(\.managedObjectContext) private var viewContext
    @State private var exampleString: Date = Date()
    @State private var searchText: String = ""
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.date, ascending: false)]) private var datas: FetchedResults<Entity>
    
    var body: some View {
        
        
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(datas) { data in
                        
                        if let category = data.category {
                            if category == searchText {
                                NavigationLink {
                                    PlayView(data: data)
                                } label: {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.mint, lineWidth: 1)
                                        .frame(height: 80)
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 10) {

                                                    HStack {
                                                        if let data = data.date {
                                                            Text("\(data, style: .date)")
                                                                .font(.footnote)
                                                                .foregroundColor(.gray)
                                                                .padding(.trailing, 20)
                                                        }

                                                        Text(data.category ?? "")
                                                            .background {
                                                                RoundedRectangle(cornerRadius: 12)
                                                                    .fill(mainCategoies[Int(data.colorIndex)])
                                                                    .frame(width: 45, height: 25, alignment: .center)
                                                            }
                                                            .tint(.white)

                                                    }

                                                    Text(data.title ?? "")
                                                        .font(.title3)
                                                        .foregroundColor(.black)

                                                }
                                                Spacer()

                                                Button {
                                                    removeData(target: data)
                                                } label: {
                                                    Image(systemName: "trash")
                                                        .tint(.red)
                                                }
                                            }
                                            .padding(.horizontal, 10)
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .searchable(text: $searchText, prompt: "카테고리로 검색")
            .navigationBarTitle("운동일지")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
    func removeData(target: FetchedResults<Entity>.Element) {
        withAnimation {
            viewContext.delete(target)
            try? viewContext.save() // 삭제하고 저장 꼭 해야함!
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


/*
 NavigationLink {
 PlayView(data: data)
 } label: {
 RoundedRectangle(cornerRadius: 12)
 .stroke(.mint, lineWidth: 1)
 .frame(height: 80)
 .overlay {
 HStack {
 VStack(alignment: .leading, spacing: 10) {
 
 HStack {
 if let data = data.date {
 Text("\(data, style: .date)")
 .font(.footnote)
 .foregroundColor(.gray)
 .padding(.trailing, 20)
 }
 
 Text(data.category ?? "")
 .background {
 RoundedRectangle(cornerRadius: 12)
 .fill(mainCategoies[Int(data.colorIndex)])
 .frame(width: 45, height: 25, alignment: .center)
 }
 .tint(.white)
 
 }
 
 Text(data.title ?? "")
 .font(.title3)
 .foregroundColor(.black)
 
 }
 Spacer()
 
 Button {
 removeData(target: data)
 } label: {
 Image(systemName: "trash")
 .tint(.red)
 }
 }
 .padding(.horizontal, 10)
 }
 }
 */
