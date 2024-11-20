//
//  SearchFieldView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/18/24.
//

import SwiftUI

struct SearchFieldView: View {
    
    @State var show = false
    @State var text: String = ""
    @FocusState var isTyping: Bool
    
    var body: some View {
        ZStack {
            Color.SBG.ignoresSafeArea()
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: show ? 15 : 30)
                    .foregroundStyle(.thinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 6)
                
                HStack {
                    Image(systemName: show ? "xmark.circle.fill" : "magnifyingglass")
                        .foregroundStyle(.primary.opacity(0.5))
                        .contentTransition(.symbolEffect)
                        .onTapGesture {
                            withAnimation {
                                show.toggle()
                            }
                        }
                    
                    TextField("Search", text: $text)
                        .focused($isTyping)
                        .opacity(show ? 1 : 0)
                }
                .padding(.leading, 12)
            }
            .frame(width: show ? 300 : 50  , height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 70)
            .clipped()
            .padding(.leading, 12)
            .onTapGesture {
                withAnimation {
                    show.toggle()
                }
            }
            
        }
    }
}

#Preview {
    SearchFieldView()
}
