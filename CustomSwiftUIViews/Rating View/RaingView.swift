//
//  RaingView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/20/24.
//

import SwiftUI

struct RaingView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    
    var body: some View {
        HStack {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.yellow)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.yellow)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: 250)
    }
}

#Preview {
    struct PreviewWapper: View {
        let maxRating: Int = 5
        @State var currentRating: Int = 3
        var body: some View {
            RaingView(
                maxRating: maxRating,
                currentRating: $currentRating
            )
        }
    }
    return PreviewWapper()
}
