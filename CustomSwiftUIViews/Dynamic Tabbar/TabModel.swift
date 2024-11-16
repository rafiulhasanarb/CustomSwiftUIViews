//
//  TabModel.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI
import Foundation

struct TabModel: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
}

struct CustomTabBar: View {
    
    var tabs: [TabModel] = [
        TabModel(icon: "person", title: "Accounts"),
        TabModel(icon: "house", title: "Home"),
        TabModel(icon: "book", title: "Book"),
        TabModel(icon: "creditcard", title: "Payments"),
        TabModel(icon: "arrow.right.arrow.left", title: "Transfers")
    ]
    @State var selectedTab = 0
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                //0
                redView()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //1
                blueView()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //2
                greenView()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //3
                grayView()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //4
                yellowView()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
            }
            .offset(x: -geo.size.width * CGFloat(selectedTab))
        }
        .overlay(alignment: .bottom) {
            HStack {
                ForEach(tabs.indices, id: \.self) { tab in
                    HStack(spacing: 14) {
                        Image(systemName:  tabs[tab].icon)
                        if selectedTab == tab {
                            Text(tabs[tab].title)
                                .bold()
                                .transition(.scale(scale: 0, anchor: .trailing).combined(with: .opacity))
                        }
                    }
                    .font(.title3)
                    .frame(maxWidth: selectedTab == tab ? .infinity : 44)
                    .frame(height: 44)
                    .background(Color(.systemGray6), in: .rect(cornerRadius: 12))
                    .clipped()
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tab
                        }

                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CustomTabBar()
}

struct redView: View {
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Red view")
                .font(.largeTitle)
        }
    }
}

struct blueView: View {
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Blue view")
                .font(.largeTitle)
        }
    }
}

struct greenView: View {
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Green view")
                .font(.largeTitle)
        }
    }
}

struct grayView: View {
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("Gray view")
                .font(.largeTitle)
        }
    }
}

struct yellowView: View {
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text("Yellow view")
                .font(.largeTitle)
        }
    }
}
