//
//  DetailView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI

struct DetailView: View {
    
    let product: Product
    
    var body: some View {
        
        ZStack (alignment: .topLeading){
            VStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
                        .ignoresSafeArea()
                        .shadow(color: .black, radius: 10)
                    
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.name)
                            .font(.system(size: 15))
                            .bold()
                        
                        Spacer()
                        
                        Text("\(product.price)")
                            .font(.system(size: 15))
                            .bold()
                    }
                    
                    Text(product.description)
                        .font(.system(size: 13))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("Добавить в корзину")
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .bold()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Capsule())
                        
                        
                    }

                    
                }
                .padding(.horizontal)
                
            }
            .navigationBarBackButtonHidden(true)
            BackButtonView()
                .padding(.leading)
        }
    }
}

#Preview {
    DetailView(product: .dum)
}
