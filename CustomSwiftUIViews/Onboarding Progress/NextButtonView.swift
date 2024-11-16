//
//  NextButtonView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct NextButtonView: View {
    
    @State var show = false
    @Binding var currentStep: Int
    var color: Color
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .frame(width: 300, height: 300)
                Circle()
                    .frame(width: 230, height: 230)
            }
            .foregroundStyle(color)
            .opacity(0.15)
            
            Image(systemName: "arrow.right")
                .font(.largeTitle)
                .offset(x: -92, y: -40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .offset(x: 150, y: 150)
        .scaleEffect(show ? 1 : 0, anchor: .bottomTrailing)
        .onTapGesture {
            action()
        }
        .onChange(of: currentStep) { oldValue, newValue in
            show.toggle()
            
            withAnimation(.linear(duration: 0.5)) {
                show.toggle()
            }
        }
        .onAppear() {
            withAnimation {
                show.toggle()
            }
        }
    }
}

#Preview {
    NextButtonView(currentStep: .constant(0), color: .blue, action: {})
}
