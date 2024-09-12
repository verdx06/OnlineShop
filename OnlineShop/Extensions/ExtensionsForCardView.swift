//
//  ExtensionsForCardView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 11.09.2024.
//

import Foundation
import SwiftUI


extension ProductCard {
    
    var priceAndName: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("\(product.price) $")
                    .font(.system(size: 25))
                    .bold()
                
                if let attributedString = try? AttributedString(markdown: "~~\(product.price * 3) $~~") {
                    Text(attributedString)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            Text(product.name)
        }
        
    }
    
}
