//
//  FavoriteProducts.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 10.09.2024.
///Users/verdx/Desktop/proekt/OnlineShop/OnlineShop/Views/CartViewForProducts.swift

import SwiftUI
import FirebaseFirestore

struct FavoriteProducts: View {
    @FirestoreQuery(collectionPath: "shop", predicates: [.isEqualTo("favorite", true)]) private var items: [Product]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            ScrollView {
                if items.isEmpty {
                    NofavoriteProduct()
                } else {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 1), content: {
                        ForEach(items) { item in
                            ProductCard(product: item)
                                .padding(.bottom, 70)
                        }
                    })
                }
            }
        }
            
        
        // MARK: - Navigation Bar
            .navigationTitle("Products")
    }
}

#Preview {
    FavoriteProducts()
}
