//
//  CustomTextFieldView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    @State private var fname: String = ""
    @State private var lname: String = ""
    
    var body: some View {
        VStack(spacing: 50) {
            InfoField(title: "First Name", text: $fname)
            InfoField(title: "Last Name", text: $lname)
        }
        .padding()
    }
}






#Preview {
    CustomTextFieldView()
}

struct InfoField: View {
    let title: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(title, text: $text)
                .padding(.leading)
                .frame(height: 50)
                .focused($isTyping)
                .background(isTyping ? .blue : Color.primary, in: RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
            
            Text(title)
                .padding(.horizontal, 4)
                .background(.red.opacity(isTyping || text.isEmpty ? 1 : 0))
                .foregroundColor(isTyping ? .blue : Color.primary)
                .padding(.leading)
                .offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
            
        }
        .animation(.linear(duration: 0.2), value: isTyping)
    }
}

