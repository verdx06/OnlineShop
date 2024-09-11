//
//  ContentView.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 10.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                    ForEach(items) { item in
                        ProductCard(product: item)
                            .padding(.bottom, 40)
                    }
                })
            }
            
            // MARK: - Navigation Bar
            .navigationTitle("Products")
            .navigationBarItems(leading: LeadingButton, trailing: TrailingButton)
        }
    }
}


extension ContentView {
    
    private var TrailingButton: some View {
        NavigationLink(destination: CardViewForProducts()) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(Color.black)
                        .font(.title2)
                }

    }
    
    private var LeadingButton: some View {
        NavigationLink(destination: FavoriteProducts()) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.black)
                        .font(.title2)
                }

    }
}

#Preview {
    ContentView()
}



