//
//  BackButtonView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI

struct BackButtonView: View {
    
    @Environment (\.presentationMode) var presentation
    
    var body: some View {
        Button {
            presentation.wrappedValue.dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black.opacity(0.3))
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
        }

    }
}

#Preview {
    BackButtonView()
}
