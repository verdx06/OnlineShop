import SwiftUI
import FirebaseFirestore

struct CartView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        VStack {
            ScrollView {
                if checkCount() {
                    ForEach(items.filter{ $0.count ?? 0 >= 1 }) { item in
                        ProductViewForCart(product: item)
                    }
                }else {
                    NoProductViewForCart()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                }
            }
            
            Text("Total: \(viewModel.titleCount)$")
                .bold()
                .padding(.bottom)
            
            CustomBlackButton(title: "Купить") {
                //
            }
            .padding(.horizontal, 30)
        }.navigationTitle("Корзина")
        
        
    }
    
    func checkCount() -> Bool {
        for item in items {
            if item.count ?? 0 >= 1 {
                return true
            }
        }
        return false
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}


