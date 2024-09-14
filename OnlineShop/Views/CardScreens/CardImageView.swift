//
//  CardImageView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 11.09.2024.
//

import SwiftUI

struct CardImageView: View {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
            ZStack {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .cornerRadius(20)
                } placeholder: {
                    ProgressView()
                        .font(.title)
                        .frame(width: width, height: height)
                }
            }
    }
}
