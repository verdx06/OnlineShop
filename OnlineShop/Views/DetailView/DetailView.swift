//
//  DetailView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct DetailView: View {
    
    let product: Product
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    @EnvironmentObject var viewModel: ViewModel
    @State var isAlert: Bool = false
    
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
                    
                    
                    detailViewWithProduct

                    
                }
                .padding(.horizontal)
                
            }
            .navigationBarBackButtonHidden(true)
            BackButtonView()
                .padding(.leading)
        }
    }
    
    func checkCount() -> Bool {
        if let id = product.id {
            for item in items {
                if item.count ?? 0 >= 1, item.id == id {
                    return true
                }
            }
            return false
        }
        return false
    }

    
}

extension DetailView {
    
    private var detailViewWithProduct: some View {
        Group {
            if checkCount(), let count = product.count {
                ZStack {
                    Capsule()
                        .frame(maxWidth: .infinity)
                        .frame(height: 65)
                        .bold()
                        .foregroundColor(.black)
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
            }
        }
    }
}


#Preview {
    DetailView(product: .dum)
        .environmentObject(ViewModel())
}
