//
//  BuyView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 23.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct BuyView: View {
    
    @FirestoreQuery(collectionPath: "map") private var items: [Map]
    
    var body: some View {
        VStack {
            ForEach(items) { item in
                MapView(map: item)
            }
        }
    }
}

#Preview {
    BuyView()
}
