//
//  CardViewForProducts.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 11.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct CartViewForProducts: View {
    
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        VStack {
            Text("dd")
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
    CartViewForProducts()
}
