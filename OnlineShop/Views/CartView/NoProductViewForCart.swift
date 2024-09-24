//
//  NoProductViewForCart.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI

struct NoProductViewForCart: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Нет ни одного продукта!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 8)
                Text("Тебе понравилась какая-то вещь, но нет денег ее купить? Добавь в корзину, чтобы сделать это позже!")
                    .padding(.bottom, 20)
                NavigationLink  {
                    ContentView()
                } label: {
                    Text("Добавить первый продукт🥳")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.black)
                        .font(.headline)
                        .cornerRadius(10)
                        .padding(.horizontal, 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        }
                    
                }
                .padding(.horizontal, 30)
                

            }.frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoProductViewForCart()
}
