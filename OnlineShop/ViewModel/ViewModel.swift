//
//  ViewModel.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 12.09.2024.
//

import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject {
    // MARK: - Properties
    private let database = Firestore.firestore().collection("shop")
    
    // MARK: - Methods
    func toggleFavorite(product: Product) {
        if let id = product.id {
            database.document(id).updateData(["favorite" : !product.favorite])
        }
    }
}
