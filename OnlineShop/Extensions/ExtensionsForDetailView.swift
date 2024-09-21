import Foundation
import SwiftUI

extension DetailView {
    
    var detailViewWithProduct: some View {
        Group {
            if checkCount(), let count = product.count {
                ZStack {
                    Capsule()
                        .frame(maxWidth: .infinity)
                        .frame(height: 65)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        HStack {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                                .onTapGesture {
                                    viewModel.minusProdutInCart(product: product)
                                }
                            
                            Spacer()
                            
                            Text("\(count)")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                                .onTapGesture {
                                    viewModel.addProdutInCart(product: product)
                                }
                        }
                        .padding(.horizontal, 40)
                        Text("В корзине")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .offset(y: 20)
                }
            } else {
                CustomBlackButton(title: "Добавить продукт") {
                    viewModel.addProdutInCart(product: product)
                }
                .padding()
            }
        }
    }
    
    var NamePriceDescription: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.name)
                    .font(.system(size: 15))
                    .bold()
                
                Spacer()
                
                Text("\(product.price)$")
                    .font(.system(size: 15))
                    .bold()
            }
            
            Text(product.description)
                .font(.system(size: 13))
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}
