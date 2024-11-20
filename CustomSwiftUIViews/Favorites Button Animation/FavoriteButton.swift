//
//  FavoriteButton.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/20/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    @State var added = false
    
    var body: some View {
        HStack {
            Image(systemName: added ? "heart.fill" : "heart")
                .foregroundStyle(added ? .red : .black)
                .symbolEffect(.bounce, options: .repeat(added ? 2 : 0), value: added)
            
            Group {
                if added {
                    Text("Added To Favorite")
                        .transition(.offset(y: 40))
                } else {
                    Text("Add To Favorite")
                        .transition(.offset(y: -40))
                }
            }
            .frame(width: 180, alignment: .leading)
            .foregroundStyle(.black)
        }
        .font(.title2)
        .padding(12)
        .background(Color.white, in: .rect(cornerRadius: 12))
        .clipped()
        .shadow(color: .black.opacity(0.15), radius: 10)
        .onTapGesture {
            withAnimation {
                added.toggle()
            }
        }
    }
}

#Preview {
    FavoriteButton()
}
