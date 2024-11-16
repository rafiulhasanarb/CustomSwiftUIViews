//
//  ScrollableTabBarView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct MyView: Identifiable {
    var id = UUID()
    var title: String
    var theView: AnyView
    var size: CGSize = .zero
    var minX: CGFloat = .zero
}

struct ScrollableTabBarView: View {
    
    @Binding var tabs: [MyView]
    @Binding var activeIndex: Int
    @Binding var tabBarScrollableState: String?
    @Binding var mainViewScrollableState: String?
    
    var textColor: Color
    var proxy: ScrollViewProxy
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach($tabs.indices, id:\.self) { index in
                    
                    Button(action: {
                        withAnimation(.snappy) {
                            activeIndex = index
                            tabBarScrollableState = tabs[index].title
                            mainViewScrollableState = tabs[index].title
                            proxy.scrollTo(tabs[index].title, anchor: .center)
                        }
                    }, label: {
                        Text(tabs[index].title)
                            .padding(.vertical, 12)
                            .foregroundStyle(textColor)
                            .contentShape(.rect)
                    })
                    .buttonStyle(PlainButtonStyle())
                    .id(tabs[index].title)
                    .rect { rect in
                        tabs[index].size = rect.size
                        tabs[index].minX = rect.minX
                    }
                }
            }
        }
    }
}

#Preview {
    //ScrollableTabBarView()
}
