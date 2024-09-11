//
//  Product.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 10.09.2024.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var favorite: Bool
    var count: Int?
}


extension Product {
    static var dum: Product {
        .init(
            name: "Супер игровая приставка",
            description: "mnogo",
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-883f2.appspot.com/o/products%2F1703824972_001a.webp?alt=media&token=cd228ab2-458c-4a8b-b610-50a08fda7b85",
            price: 123,
            favorite: false
        )
    }
}

