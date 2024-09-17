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
        
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 7, x: 5, y: 6)
            
            
            HStack {
                
                if let url  = URL(string: product.image) {
                    CardImageView(
                        url: url,
                        width: 100,
                        height: 100
                    )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Text(product.name)
                            .font(.system(size: 15))
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20))
                            .onTapGesture {
                                viewModel.deleteProdutInCart(product: product)
                            }
                    }
                    
                    HStack {
                        
                        if let count = product.count {
                            let sum = count * product.price
                            Text("\(sum)$")
                                .font(.system(size: 15))
                                .bold()
                        }
                        
                        Spacer()
                        
                        Image(systemName: "minus.rectangle.fill")
                            .font(.system(size: 20))
                            .onTapGesture {
                                viewModel.minusProdutInCart(product: product)
                            }
                        
                        if let count = product.count {
                            Text("\(count)")
                                .font(.system(size: 20))
                        }
                        
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 20))
                            .onTapGesture {
                                viewModel.addProdutInCart(product: product)
                            }
                        
                    }
                } 
                
                Spacer()
            }
        } .padding(10)
    }
}

#Preview {
    ProductViewForCart(product: .dum)
        .environmentObject(ViewModel())
}
