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
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-883f2.appspot.com/o/products%2Fxiaomi-mi-display-1a-predstavenie.jpg?alt=media&token=9b3a578f-e45b-48a5-a314-b75ba1c518be",
            price: 123,
            favorite: false,
            count: 2
        )
    }
}

