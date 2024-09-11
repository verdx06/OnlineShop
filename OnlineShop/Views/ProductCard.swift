//
//  ProductCard.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 10.09.2024.
//

import SwiftUI

struct ProductCard: View {
    
    let product: Product
    
    var body: some View {
        GeometryReader(content: {
            geo in
            let size = geo.size
            
            VStack(alignment: .leading) {
                if let url = URL(string: product.image)
                {
                    ZStack(alignment: .topTrailing) {
                        CardImageView(
                            url: url,
                            width: size.width,
                            height: size.height)
                        Button {
                            //
                        } label: {
                            Image(systemName: "heart.fill")
                                .font(.largeTitle)
                                .foregroundColor(product.favorite ? .red : .white)
                                .overlay {
                                    Image(systemName: "heart")
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                        .padding()
                                }
                            
                        }.padding()
                    }
                    
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
                    
                    
                }
            }
            
        })
        .frame(height: UIScreen.main.bounds.height * 0.7)
        .background(.background.opacity(0.5))
        .padding(10)
    }
}

#Preview {
    ProductCard(product: .dum)
}
