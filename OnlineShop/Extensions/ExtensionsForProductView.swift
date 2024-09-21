import Foundation
import SwiftUI

extension ProductViewForCart {
    
     var Rectangle: some View {
        SwiftUI.Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.1), radius: 7, x: 5, y: 6)
    }
    
     var TitleAndXmark: some View {
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
    }
    
     var RemoteControl: some View {
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
