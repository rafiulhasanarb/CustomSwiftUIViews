//
//  InterActiveTabBarView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/20/24.
//

import SwiftUI

struct TabBarModel: Identifiable {
    let id = UUID()
    let iconName: String
    var color: Color
    var tab: TabIcon
    var index: Int
}

enum TabIcon: String {
    case home
    case search
    case favorite
    case profile
    case cart
}

struct InterActiveTabBarView: View {
    @State private var selectedTab: TabIcon = .home
    @State var tabOffset: CGFloat = 0
    
    let tabItem = [
        TabBarModel(iconName: "house", color: .red, tab: .home, index: 0),
        TabBarModel(iconName: "magnifyingglass", color: .blue, tab: .search, index: 1),
        TabBarModel(iconName: "star", color: .green, tab: .favorite, index: 2),
        TabBarModel(iconName: "person", color: .green, tab: .profile, index: 3),
        TabBarModel(iconName: "square.stack", color: .green, tab: .cart, index: 4),
        ]
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                TabBarHomeView()
            case .search:
                TabBarCardView()
            case .favorite:
                TabBarFavoriteView()
            case .profile:
                TabBarProfileView()
            case .cart:
                TabBarPurchaseView()
            }
            
            VStack {
                Spacer()
                HStack {
                    ForEach(tabItem) { item in
                        Button(action: { selectedTab = item.tab }) {
                            Image(systemName: item.iconName)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 30, height: 30)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(selectedTab == item.tab ? .green : .gray)
                    }
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.gray.opacity(0.25))
                }
            }
            .padding()
        }
    }
}

#Preview {
    InterActiveTabBarView()
}

struct ImageGridView: View {
    
    var images: [String]
    var startIndex: Int
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible())]) {
            ForEach(images.indices, id: \.self) { item in
                Image("image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: getHeight(for: item))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
    
    private func getHeight(for index: Int) -> CGFloat {
        return (index + startIndex) % 2 == 0 ? 150 : 300
    }
}

struct TabBarHomeView: View {
    var body: some View {
        Text("Home View")
    }
}

struct TabBarCardView: View {
    var body: some View {
        Text("Card View")
    }
}

struct TabBarFavoriteView: View {
    var body: some View {
        Text("Favorite View")
    }
}

struct TabBarPurchaseView: View {
    var body: some View {
        Text("Purchase View")
    }
}

struct TabBarProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

