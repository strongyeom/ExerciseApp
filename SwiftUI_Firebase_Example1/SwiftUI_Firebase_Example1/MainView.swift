//
//  MainView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/28.
//

// 코어 데이터 사용? userDefault사용? 로컬에 데이터 저장하는 법 공부하기
// 파이어베이스 사용 되도록 안해보기


import SwiftUI

var mainCategoies: [Color] = [.red, .yellow, .mint, .gray, .green]

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.date, ascending: false)]) private var datas: FetchedResults<Entity>

    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(datas) { data in
                        NavigationLink {
                            PlayView(data: data)
                           //EmptyView()
                        } label: {
                                Rectangle()
                                    .stroke(.mint, lineWidth: 1)
                                    .frame(height: 80)
                                    .overlay {

                                        HStack {
                                            VStack(alignment: .leading, spacing: 10) {
                                                HStack {
                                                    Text("\(Date.now, style: .date)")
                                                        .font(.footnote)
                                                        .foregroundColor(.gray)
                                                        .padding(.trailing, 20)
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

                                            }
                                            Spacer()

                                            // 삭제하기 어떻게 만들지 고민해보기
                                            // 1. Alert
                                            // 2. Swiping

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
            .padding()
            .navigationTitle("운동일지")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddView()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
        func removeData(target: FetchedResults<Entity>.Element) {
          withAnimation {
            viewContext.delete(target)
            try? viewContext.save() // 삭제하고 저장 꼭 해야함!
          }
        }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
