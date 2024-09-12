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
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 1)) {
                    ForEach(items) { item in
                        ProductCard(product: item)
                            .padding(.bottom, 70)
                        Divider()
                    }
                }
            }.padding(.horizontal, 10)
                .navigationBarBackButtonHidden(true)
            // MARK: - Navigation Bar
            .navigationTitle("Товары")
            .navigationBarItems(leading: LeadingButton, trailing: TrailingButton)
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(ViewModel())
}



