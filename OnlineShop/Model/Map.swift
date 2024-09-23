//
//  Map.swift
//  OnlineShop
//
//  Created by Виталий Багаутдинов on 23.09.2024.
//

import Foundation
import FirebaseFirestore

struct Map: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var cod: Int
    var data: String
    var numbers: Int
}


extension Map {
    
    static var fakemap: Map {
        .init(
            name: "Vital",
            cod: 234,
            data: "09/23",
            numbers: 2220333044405550
        )
    }
    
}
