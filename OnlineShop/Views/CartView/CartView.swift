//
//  CartView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 13.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct CartView: View {
    
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        ScrollView {
            VStack {
                if checkCount() {
                    ForEach(items.filter{ $0.count ?? 0 >= 1 }) { item in
                        ProductViewForCart(product: item)
                    }
                }else {
                    NofavoriteProduct()
                }
            }
        }
    }
    
    func checkCount() -> Bool {
        for item in items {
            if item.count ?? 0 >= 1 {
                return true
            }
        }
        return false
    }
}

#Preview {
    CartView()
}


