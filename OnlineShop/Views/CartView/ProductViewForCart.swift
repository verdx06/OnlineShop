//
//  ProductViewForCart.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI

struct ProductViewForCart: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let product: Product
    
    var body: some View {
            
            HStack {
                
                if let url  = URL(string: product.image) {
                    CardImageView(
                        url: url,
                        width: 100,
                        height: 100
                    )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(product.name)
                        .font(.system(size: 15))
                        .bold()
                    
                    Image(systemName: "xmark.circle.fill")
                    
                    HStack {
                        
                        Text("\(product.price)$")
                            .font(.system(size: 15))
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            viewModel.minusProdutInCart(product: product)
                        } label: {
                            Image(systemName: "minus.rectangle.fill")
                                .font(.system(size: 20))
                        }
                        
                        if let count = product.count {
                            Text("\(count)")
                                .font(.system(size: 20))
                        }
                        
                        Button {
                            viewModel.addProdutInCart(product: product)
                        } label: {
                            Image(systemName: "plus.rectangle.fill")
                                .font(.system(size: 20))
                        }
                        
                    }
                }
                
                Spacer()
            
            .background()
        }
    }
}

#Preview {
    ProductViewForCart(product: .dum)
        .environmentObject(ViewModel())
}
