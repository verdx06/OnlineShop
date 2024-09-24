import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject {
    // MARK: - Properties
    private let database = Firestore.firestore().collection("shop")
    private let databaseMap = Firestore.firestore().collection("map")
    @Published var cartItem: [Product] = []
    
    var titleCount: Int {
        cartItem.reduce(0) { $0 + ($1.price * ($1.count ?? 0))}
    }
    
    init() {
        fetchItems()
    }
    
    private func fetchItems() {
        database.addSnapshotListener { snapshot, error in
            if let document = snapshot?.documents {
                self.cartItem = document.compactMap{ document -> Product? in
                    try? document.data(as: Product.self)
                }
            }
            else {
                print("Error \(error!)")
                return
            }
        }
    }
    
    // MARK: - Methods
    func toggleFavorite(product: Product) {
        updateDatabase(product: product, data: ["favorite" : !product.favorite])
    }
    
    func addProdutInCart(product:Product) {
        updateDatabase(product: product, data: ["count" : (product.count ?? 0) + 1])
    }
    
    func minusProdutInCart(product:Product) {
        let maxMinus = max((product.count ?? 0) - 1, 1)
        updateDatabase(product: product, data: ["count" : maxMinus])
    }
    
    func deleteProdutInCart(product:Product) {
        updateDatabase(product: product, data: ["count" : 0])
    }
    
    func setMapChoice(map: Map, choice: Bool) {
        updateDatabaseMap(map: map, data: ["asChoise" : choice])
    }
    
    private func updateDatabaseMap(map: Map, data: [String : Any]) {
        if let id = map.id {
            databaseMap.document(id).updateData(data)
        }
    }
    
    private func updateDatabase(product: Product, data: [String : Any]) {
        if let id = product.id {
            database.document(id).updateData(data)
        }
    }
    
}
