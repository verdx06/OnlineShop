//
//  RemoteControl.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 18.09.2024.
//

import SwiftUI

struct RemoteControl: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let product: Product
    
    var body: some View {
        VStack (alignment: .trailing, spacing: 20){
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 20))
                .onTapGesture {
                    viewModel.deleteProdutInCart(product: product)
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
    }
}
