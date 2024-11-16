//
//  RectKey.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct RectKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func rect(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .scrollView(axis: .horizontal))
                    Color
                        .clear
                        .preference(key: RectKey.self, value: rect)
                        .onPreferenceChange(RectKey.self, perform: completion)
                }
            }
    }
}

extension CGFloat {
    func interpolation(inputRange: [CGFloat], outputRange: [CGFloat]) -> CGFloat {
        let x = self
        let length = inputRange.count - 1
        
        if x <= inputRange[0] {
            return outputRange[0]
        }
        
        for index in 0..<length {
            let x1 = inputRange[index - 1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index - 1]
            let y2 = outputRange[index]
            
            if x <= inputRange[index] {
                let y = y1 + ((y2 - y1) / (x2 - x1) * (x - x1))
                return y
            }
        }        
        return outputRange[length]
    }
}
