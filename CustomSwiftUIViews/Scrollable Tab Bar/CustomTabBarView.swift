//
//  CustomTabBarView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var tabs: [MyView]
    @Binding var activeIndex: Int
    @Binding var tabBarScrollableState: String?
    @Binding var mainViewScrollableState: String?
    @Binding var progress: CGFloat
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                ScrollableTabBarView(tabs: $tabs, activeIndex: $activeIndex, tabBarScrollableState: $tabBarScrollableState, mainViewScrollableState: $mainViewScrollableState, textColor: .gray, proxy: proxy)
                
                ScrollableTabBarView(tabs: $tabs, activeIndex: $activeIndex, tabBarScrollableState: $tabBarScrollableState, mainViewScrollableState: $mainViewScrollableState, textColor: .primary, proxy: proxy)
                    .mask {
                        TabIndicatorView(tabs: tabs, progress: progress)
                    }
            }
        }
        .scrollPosition(id: .init(get: {
            return tabBarScrollableState
        }, set: { _ in
            
        }), anchor: .center)
        .background(alignment: .bottom) {
            TabIndicatorView(tabs: tabs, progress: progress)
        }
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
        .padding(.bottom)
        .background(.thinMaterial)
    }
}

#Preview {
    //CustomTabBarView()
    ScrollableHomeView()
}


struct TabIndicatorView: View {
    
    let tabs: [MyView]
    let progress: CGFloat
    
    var body: some View {
        ZStack {
            let inputRange = tabs.indices.map {CGFloat($0)}
            let outputRange = tabs.map {$0.size.width}
            let outputPositionRange = tabs.map{$0.minX}
            let indicatorWidth = progress.interpolation(inputRange: inputRange, outputRange: outputRange)
            let indicatorPosition = progress.interpolation(inputRange: inputRange, outputRange: outputPositionRange)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.thinMaterial)
                .frame(width: indicatorWidth + 20, height: 3)
                .offset(x: indicatorPosition - 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(color: .black.opacity(0.15), radius: 2)
        }
    }
}

