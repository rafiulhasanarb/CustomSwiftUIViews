//
//  ExpendButtonView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/20/24.
//

import SwiftUI

struct ExpendButtonView: View {
    
    @State var expand = false
    var title: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: expand ? 5 : 10)
                .frame(width: expand ? 300 : 180, height: expand ? 25 : 50)
                .foregroundStyle(Color(color))
                
            Text(title)
                .foregroundStyle(.black)
                .kerning(expand ? 15 : 5)
                .frame(width: 300, height: 50)
                .offset(x: expand ? 8 : 5)
        }
        .animation(.default, value: expand)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    expand = true
                }
                .onEnded { _ in
                    expand = false
                    action()
                }
        )
    }
}

#Preview {
    ExpendButtonView(title: "Download", color: .cyan, action: {})
}
