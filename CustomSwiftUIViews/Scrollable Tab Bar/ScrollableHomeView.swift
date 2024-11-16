//
//  ScrollableHomeView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct ScrollableHomeView: View {
    
    @State var tabs: [MyView] = [
        MyView(title: "All", theView: AnyView(Color.cyan)),
        MyView(title: "Romantic Comedy", theView: AnyView(Color.red)),
        MyView(title: "Thriller", theView: AnyView(Color.blue)),
        MyView(title: "Documentary Films", theView: AnyView(Color.purple)),
        MyView(title: "Sci-Fi", theView: AnyView(Color.orange)),
        MyView(title: "Historical Dramas", theView: AnyView(Color.pink))
    ]
    
    @State var activeIndex: Int = 0
    @State var tabBarScrollableState: String?
    @State var mainViewScrollableState: String?
    @State var progress: CGFloat = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            CustomTabBarView(tabs: $tabs, activeIndex: $activeIndex, tabBarScrollableState: $tabBarScrollableState, mainViewScrollableState: $mainViewScrollableState, progress: $progress)
            
            GeometryReader { geo in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            tabs[index].theView
                                .id(tabs[index].title)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                    .rect { rect in
                        progress = -rect.minX / geo.size.width
                    }
                }
                .scrollPosition(id: $mainViewScrollableState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .onChange(of: mainViewScrollableState) { oldValue, newValue in
                    if let newValue, let newIndex = tabs.firstIndex(where: {$0.title == newValue}) {
                        withAnimation(.snappy) {
                            tabBarScrollableState = newValue
                            activeIndex = newIndex
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ScrollableHomeView()
}
