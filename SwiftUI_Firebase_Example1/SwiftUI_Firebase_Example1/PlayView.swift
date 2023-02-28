//
//  PlayView.swift
//  SwiftUI_Firebase_Example1
//
//  Created by 염성필 on 2023/02/28.
//

import SwiftUI

struct PlayView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entity.date, ascending: false)]) private var datas: FetchedResults<Entity>

   var data: Entity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(data.title ?? "")
                .font(.title3)
            Text(data.content ?? "")
            
            // 운동시작 타이머: 타이머 누르면 타이머 작동
            
            // 쉬는 시간 타이머: 시간 설정하고 시작 시간되면 0으로 자동 리셋
            
            // 운동 종료 버튼: 버튼 누르면 dismiss되면서 화면 사라짐
               
        }
       
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(data: Entity())
    }
}
