//
//  ProductCard.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 10.09.2024.
//

import SwiftUI

struct ProductCard: View {
    
    let product: Product
    @EnvironmentObject var viewModel: ViewModel
    
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
                            viewModel.toggleFavorite(product: product)
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
                    
                    priceAndName
                    
                    
                }
            }
            
        })
        .frame(height: UIScreen.main.bounds.height * 0.3)
    }
}

#Preview {
    ProductCard(product: .dum)
        .environmentObject(ViewModel())
}
