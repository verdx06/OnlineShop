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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("ok")
            }
            .navigationTitle("Products")
            .navigationBarItems(trailing:
                NavigationLink(destination: {
                //
            }, label: {
                Image(systemName: "cart.fill")
                    .foregroundColor(Color.black)
            })
            )
        }
    }
}

#Preview {
    ContentView()
}
