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
            ScrollView {
                ForEach(items) { item in
                    VStack(alignment: .leading){
                        HStack {
                            MapView(map: item)
                            Spacer()
                        }
                        .padding(.leading)
                    }
                }
            }
            CustomBlackButton(title: "Оформить покупку") {
                //
            }
            .padding()
        }.navigationTitle("Выберите карту")
    }
}

#Preview {
    NavigationView {		
        BuyView()
            .environmentObject(ViewModel())
    }
}
